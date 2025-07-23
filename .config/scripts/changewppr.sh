#!/bin/bash

# --- VARIÁVEIS ---
WALLPAPER_DIR="$HOME/Wallpapers"

# --- LÓGICA DO SCRIPT ---

# 1. Selecionar o Wallpaper
# Abre o seletor de arquivos 'zenity' no diretório de wallpapers.
# Se o usuário cancelar, a variável ficará vazia e o script será encerrado.
SELECTED_WALLPAPER=$(zenity --file-selection --title="Escolha um Wallpaper" --filename="$WALLPAPER_DIR/")

# Verifica se um arquivo foi realmente selecionado
if [ -z "$SELECTED_WALLPAPER" ]; then
    echo "Nenhum arquivo selecionado. Saindo."
    exit 0
fi

# 2. Identificar o nome do seu monitor
# Descobre o nome do monitor atualmente focado. Você pode substituir isso
# pelo nome fixo do seu monitor se preferir (ex: "DP-1").
MONITOR=$(hyprctl monitors | grep "focused: yes" -B 10 | grep "Monitor" | awk '{print $2}')

# 3. Mudar o Wallpaper com Hyprpaper
# 'preload' carrega a imagem na memória e 'wallpaper' a define.
hyprctl hyprpaper preload "$SELECTED_WALLPAPER"
hyprctl hyprpaper wallpaper "$MONITOR,$SELECTED_WALLPAPER"

# 4. Gerar o esquema de cores com Pywal
# O argumento '-n' impede que o wal tente definir o wallpaper (já fizemos isso).
# O argumento '-q' executa em modo silencioso (sem output no terminal).
wal -i "$SELECTED_WALLPAPER" -q -n

# 5. (Opcional, mas recomendado) Recarregar outros programas
# Se você usa Waybar, Dunst, etc., precisa recarregá-los para que apliquem o novo tema.
# Descomente as linhas relevantes para os programas que você usa.

# Para a Waybar:
killall -SIGUSR2 waybar

# Para o Dunst (serviço de notificações):
# killall dunst && dunst &

echo "Tema e wallpaper atualizados com sucesso!"
