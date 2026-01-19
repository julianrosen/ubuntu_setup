#!/usr/bin/env bash

ENV_NAME="${1:-ml}"
sudo apt install python3-pip python3-venv
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3 1
python -m venv ~/.venvs/$ENV_NAME
echo "source ~/.venvs/$ENV_NAME/bin/activate" >> ~/.zshrc
source ~/.venvs/$ENV_NAME/bin/activate
pip install scikit-learn statsmodels scikit-optimize numpy scipy pandas matplotlib seaborn xgboost torch bayesian_optimization ipykernel jupyter tqdm black isort 
