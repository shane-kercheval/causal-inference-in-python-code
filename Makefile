clone_fk_learn:
	sudo rm -rf ../temp
	sudo mkdir ../temp
	sudo git clone -b master https://github.com/nubank/fklearn.git --depth=1 ../temp

update_fk_learn:
	sudo sed -i 's/>=.*//' ../temp/requirements.txt
	sudo sed -i "s/python_requires='>=3\.6\.2,<3\.10'/python_requires='>=3.6.2,<3.12'/" ../temp/setup.py

build_fk_learn:
	sudo pip install -e ../temp

install_requirements:
	sudo apt-get update -y
	sudo apt-get install cmake -y
	sudo apt-get install graphviz -y
	sudo pip install --upgrade pip
	sudo pip install -r requirements.txt

environment: clone_fk_learn update_fk_learn build_fk_learn install_requirements

data:
	sudo jupyter nbconvert --to notebook --execute --inplace Simulated-Data.ipynb

notebooks:
	sudo jupyter nbconvert --to notebook --execute --inplace causal-inference-in-python/01-Introduction-To-Causal-Inference.ipynb
	sudo jupyter nbconvert --to notebook --execute --inplace causal-inference-in-python/02-Randomised-Experiments-and-Stats-Review.ipynb
	sudo jupyter nbconvert --to notebook --execute --inplace causal-inference-in-python/03-Graphical-Models.ipynb
	sudo jupyter nbconvert --to notebook --execute --inplace causal-inference-in-python/04-The-Unreasonable-Effectiveness-of-Linear-Regression.ipynb
	sudo jupyter nbconvert --to notebook --execute --inplace causal-inference-in-python/05-Propensity-Score.ipynb
	sudo jupyter nbconvert --to notebook --execute --inplace causal-inference-in-python/06-Effect-Heterogeneity.ipynb
	sudo jupyter nbconvert --to notebook --execute --inplace causal-inference-in-python/07-Meta-Learners.ipynb
	sudo jupyter nbconvert --to notebook --execute --inplace causal-inference-in-python/08-Difference-in-Differences.ipynb
	sudo jupyter nbconvert --to notebook --execute --inplace causal-inference-in-python/09-Synthetic-Control.ipynb
	sudo jupyter nbconvert --to notebook --execute --inplace causal-inference-in-python/10-Geo-and-Switchback-Experiments.ipynb
	sudo jupyter nbconvert --to notebook --execute --inplace causal-inference-in-python/11-Non-Compliance-and-Instruments.ipynb

all: environment data notebooks
