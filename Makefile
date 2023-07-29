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
	sudo pip install --upgrade pip
	sudo pip install -r requirements.txt

notebooks:
	sudo jupyter nbconvert --to notebook --execute --inplace Simulated-Data.ipynb
	# jupyter nbconvert --execute causal-inference-in-python/.ipynb
	# jupyter nbconvert --execute causal-inference-in-python/.ipynb
	# jupyter nbconvert --execute causal-inference-in-python/.ipynb
	# jupyter nbconvert --execute causal-inference-in-python/.ipynb
	# jupyter nbconvert --execute causal-inference-in-python/.ipynb
	# jupyter nbconvert --execute causal-inference-in-python/.ipynb
	# jupyter nbconvert --execute causal-inference-in-python/.ipynb
	# jupyter nbconvert --execute causal-inference-in-python/.ipynb
	# jupyter nbconvert --execute causal-inference-in-python/.ipynb

run: clone_fk_learn update_fk_learn build_fk_learn install_requirements
	