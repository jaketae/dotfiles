# Setting PATH for Python 3.7
PATH="/Library/Frameworks/Python.framework/Versions/3.7/bin:${PATH}"
export PATH

# RStudio configuration
export RSTUDIO_WHICH_R=/Users/jaketae/opt/anaconda3/envs/R/bin/R
launchctl setenv RSTUDIO_WHICH_R $RSTUDIO_WHICH_R

# Conda configuration
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

# Aliases
alias r='export RSTUDIO_WHICH_R=/Users/jaketae/opt/anaconda3/envs/R/bin/R; cd /Applications; open RStudio.app' 
alias clean='defaults write com.apple.dock ResetLaunchPad -bool true; killall Dock'
alias convert='cd /Users/jaketae/documents/github/jaketae.github.io/_jupyter; ./convert.sh $1'
alias init='cd /Users/jaketae/documents/github/script-automation-projects/repo-initializer; ./init.sh $1'

# Suppress update .zsh warning
export BASH_SILENCE_DEPRECATION_WARNING=1
