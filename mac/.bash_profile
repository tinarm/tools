# Editing mode
# ---------------------------------------------------------------------
set -o vi
# set -o emacs (bash default mode)

# Term colors
# ---------------------------------------------------------------------
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

# Aliases
# ---------------------------------------------------------------------
alias l='ls -lh'
alias ll='ls -lah'
alias sublime='open -a Sublime\ Text\ 2'
alias bc4='open -a Beyond\ Compare'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# Java
# ---------------------------------------------------------------------
#export JAVA_HOME=/Users/moh/glassfish4/jdk7
#export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_67.jdk/Contents/Home

function removeFromPath() {
    export PATH=$(echo $PATH | sed -E -e "s;:$1;;" -e "s;$1:?;;")
}

function setjdk() {
    if [ $# -ne 0 ]; then
        removeFromPath '/System/Library/Frameworks/JavaVM.framework/Home/bin'
        if [ -n "${JAVA_HOME+x}" ]; then
            removeFromPath $JAVA_HOME
        fi
        export JAVA_HOME=`/usr/libexec/java_home -v $@`
        export PATH=$JAVA_HOME/bin:$PATH
    fi
}
setjdk 1.8
#setjdk 1.7.0_45

# Maven
# ---------------------------------------------------------------------
export M2_HOME=/Users/moh/bin/apache-maven/apache-maven-2.2.1
export M2=$M2_HOME/bin

# PATH
# ---------------------------------------------------------------------
export PATH=~/bin:$JAVA_HOME/bin:$M2:~/bin/gradle-2.2.1/bin:~/perl5/bin:/usr/local/bin:$PATH

# Git
# ---------------------------------------------------------------------
source ~/git-completion.bash
source ~/bin/git-prompt.sh
PS1="\h:\W \u\$(__git_ps1 \" (\e[94m%s\e[0m) \")\$ "

# Perl path
# ---------------------------------------------------------------------
export PERL5LIB=$HOME/perl5/lib:$HOME/perl5/lib/perl5/darwin-thread-multi-2level:/Users/moh/devel/p/agi-scripts

# FindBugs
# ---------------------------------------------------------------------
export FINDBUGS_HOME=/Users/moh/bin/findbugs-3.0.1-rc2
