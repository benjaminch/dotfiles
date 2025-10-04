# FZF
export FZF_DEFAULT_OPTS="--layout=reverse --info=inline"
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'

# GNU
# Make all GNU flavor commands available, may override same-name BSD flavor commands
export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:${PATH}"

# JAVA
export JAVA_HOME=${HOME}/bin/java/jdk-11.0.4+11/Contents/Home
export PATH=${JAVA_HOME}/bin:${PATH}

# GRADLE
export GRADLE_HOME=$HOME/bin/gradle/gradle-6.8.3
export PATH=$GRADLE_HOME/bin:$PATH

# RUBY
eval "$(rbenv init -)"

# RUST
. "$HOME/.cargo/env"
