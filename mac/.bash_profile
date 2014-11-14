# Term colors
# ---------------------------------------------------------------------
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

# Aliases
# ---------------------------------------------------------------------
alias ll='ls -l'
alias sublime='open -a Sublime\ Text\ 2'

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
setjdk 1.7
#setjdk 1.7.0_45

# Maven
# ---------------------------------------------------------------------
export M2_HOME=/Users/moh/bin/apache-maven/apache-maven-2.0.11
export M2=$M2_HOME/bin

# PATH
# ---------------------------------------------------------------------
export PATH=$PATH:~/bin:$JAVA_HOME/bin:$M2

# Git
# ---------------------------------------------------------------------
source ~/git-completion.bash

