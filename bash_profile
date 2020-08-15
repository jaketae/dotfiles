# Suppress zsh warning
export BASH_SILENCE_DEPRECATION_WARNING=1


# Setting PATH
export PYTHON_HOME="/Library/Frameworks/Python.framework/Versions/3.7"
export SPARK_HOME="/Users/jaketae/opt/apache-spark/spark-2.4.5-bin-hadoop2.7"
export JAVA_HOME="/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home"
export R_HOME="/Users/jaketae/opt/anaconda3/envs/R"
export PATH="${PYTHON_HOME}/bin:${PATH}:${SPARK_HOME}/bin"
# export MYSQL_HOME=/usr/local/mysql/bin:$PATH


# Node
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# Git on Terminal Prompt
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\u:\W\$(parse_git_branch) $ "

# RStudio configuration
export RSTUDIO_WHICH_R="/Users/jaketae/opt/anaconda3/envs/R/bin/R"
launchctl setenv RSTUDIO_WHICH_R "${RSTUDIO_WHICH_R}"


# Setting up conda from conda.init
__conda_setup="$(CONDA_REPORT_ERRORS=false '/Users/jaketae/opt/anaconda3/bin/conda' shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "/Users/jaketae/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/jaketae/opt/anaconda3/etc/profile.d/conda.sh"
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="/Users/jaketae/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup


# Dev environment variables
# Omitted


# Alias
alias clean='defaults write com.apple.dock ResetLaunchPad -bool true; killall Dock'
alias format='cd /Users/jaketae/documents/github/jaketae.github.io/_jupyter; ./format $1'
alias init='cd /Users/jaketae/documents/github/script-automation-projects/repo-initializer; ./init.sh $1'
alias mygcc='gcc -std=c99 -Wall -Wsign-compare -Wwrite-strings -Wtype-limits -Werror -pedantic -o $1 $2'
alias r='export RSTUDIO_WHICH_R=/Users/jaketae/opt/anaconda3/envs/R/bin/R; cd /Applications; open RStudio.app'
alias github='cd /Users/jaketae/documents/github; ls'
alias pym='python manage.py'
