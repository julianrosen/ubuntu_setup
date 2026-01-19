#!/usr/bin/env bash

VENV_DIR="${1:-$HOME/.venvs}"
ENV_NAME="${2:-general}"
PIP_PACKAGES=("${@:3}")
if [[ ${#PIP_PACKAGES[@]} -eq 0 ]]; then
  PIP_PACKAGES=(scikit-learn statsmodels scikit-optimize numpy scipy pandas matplotlib seaborn xgboost torch bayesian_optimization ipykernel jupyter tqdm black isort)
fi

mkdir -p "$VENV_DIR"
sudo apt install python3-pip python3-venv
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3 1
python -m venv "$VENV_DIR/$ENV_NAME"
echo "source $VENV_DIR/$ENV_NAME/bin/activate" >> $HOME/.zshrc
source "$VENV_DIR/$ENV_NAME/bin/activate"
pip install "${PIP_PACKAGES[@]}"
