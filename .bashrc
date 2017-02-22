PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
PATH=$PATH:/usr/local/sicstus4.3.2/bin/
PATH=$PATH:/usr/local/
PATH=$PATH:/usr/local/bin/
PATH=$PATH:/Users/hiroki/.custom_commands/

alias javac='javac -J-Dfile.encoding=UTF-8'
export PGHOME=/usr/share/emacs/site-lisp/ProofGeneral-4.2
#export http_proxy="http://proxy.kuins.net:8080"
#export https_proxy="https://proxy.kuins.net:8080"
export PYTHONPATH=/Users/hiroki/python/Library/caffe/python:$PYTHONPATH

alias  activate_mlp="source ~/python/mlp/venv/bin/activate"
alias  nusmv="~/msc-ai/sem2/ar/tut2/NuSMV/bin/NuSMV"
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$MLP_WDIR/repos-3rd/OpenBLAS/lib
export OMP_NUM_THREADS=1

export JENAROOT=/Users/hiroki/msc-ai/sem2/sem/assignment2/apache-jena-3.0.1
export PATH="${JENAROOT}/bin:${PATH}"
#export PATH="~/elasticbeanstalk2.6.4/eb/macosx/python2.7:${PATH}"

. /sw/bin/init.sh

# start mysql server
alias start_mysql="/usr/local/bin/mysql.server start"
alias mypep8='pep8 --config ~/python/scouty/pep8.config'

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

eval "$(pyenv virtualenv-init -)"
