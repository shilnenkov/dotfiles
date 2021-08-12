echo "Preparing i3..."
bash ${PWD}/install_dependinces.sh

echo "Creating symbol links..."
bash ${PWD}/create_symlinks.sh

echo "Editing config files..."
bash ${PWD}/edit_configs.sh

