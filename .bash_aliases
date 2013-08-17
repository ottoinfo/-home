# Easier Navigation: .., ..., ~ and -
alias ..="cd .."
alias cd..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~" # `cd` is probably faster to type though
alias -- -="cd -"
function md() { command mkdir "$@" && cd "$@"; }

# Shortcuts
alias edit='$EDITOR ~/.bash_aliases'
alias d='cd ~/Desktop'
alias s='cd ~/Sites'
alias m='mate .'
alias sb='subl .'
alias vim='mvim'
alias grep='grep --color=auto'

alias e='echo $2'

# Shell
alias l='ls -lahf'
alias la='ls -lAGf'
alias c='clear'
alias redo='sudo \!-1'
alias rm_orig='find . -name *.orig -delete' # Recursively delete `.orig` files
alias cleanup="find . -name '*.DS_Store' -type f -ls -delete" # Recursively delete `.DS_Store` files

# Utility
alias reload='source ~/.bashrc'
alias view_asl='ls -lah /private/var/log/asl/*.asl'
alias delete_asl='sudo rm -rf /private/var/log/asl/*.asl'

# Network
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"
alias localip="ipconfig getifaddr en1"
alias flush="dscacheutil -flushcache" # Flush DNS cache

# View HTTP traffic
alias sniff="sudo ngrep -d 'en0' -W byline -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en0 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""
alias head='curl -IL'
alias whois="whois -h whois-servers.net"

# Finder 
alias o='open . &'
alias cr="open -a 'Google Chrome'"
alias sf='open -a Safari'
alias ff='open -a Firefox'

# Processes
alias tu='top -o cpu' # cpu usage
alias tv='top -o vsize' # memory usage

# Manual Textmate/Sublime($EDITOR) or Preview
function man () {
  MANWIDTH=160 MANPAGER='col -bx' man $@ | $EDITOR
}
function pman () {
    man -t "${1}" | open -f -a /Applications/Preview.app
}

# Server
alias hosts='$EDITOR /etc/hosts'
alias vhosts='$EDITOR /etc/apache2/extra/httpd-vhosts.conf'
alias httpcon='$EDITOR /etc/apache2/httpd.conf'
alias phpini='$EDITOR /etc/php.ini'

alias restart='sudo apachectl -k restart'
alias configtest='sudo apachectl configtest'
alias http_log='tail -f /var/log/apache2/access_log'
alias http_error='tail -f /var/log/apache2/error_log'
alias php_log='tail -f /var/log/php/error_log'
alias clear_php_log='echo "" > /var/log/php/error_log'
function reset_www () {
	# GET PATH & DIRECTORY
	FOLDER=$1
	if [ -z "$FOLDER" ]
	then
		FOLDER=`pwd`
	elif [ ! -d "$FOLDER" ]
	then
		echo 'EXIT - NOT A PROPER DIRECTORY PATH'
		return
	fi
	# PRINT FULL PATH
	FULL_PATH=`cd $1; pwd`
	if [ ! "$FULL_PATH" = "$FOLDER" ]
	then
		echo "Changing Folder( $FULL_PATH ) Priveleges"
	else
		echo "Changing Folder( $1 ) Priveleges"
	fi
	# VERIFY
	read -p "Continue (y/n)?" choice
	case "$choice" in 
	  y|Y ) echo "yes";;
	  n|N|* ) echo "Canceling Function";return;;
	  * ) return "invalid";;
	esac
	# CHANGE GROUP & PERMISSION
	sudo chgrp -Rv www $1
	sudo chmod -Rv g+rw $1
}

alias server='open http://localhost:8000 && python -m SimpleHTTPServer'
alias lt='localtunnel 80'

function chrome() {
    open $@ --args --allow-file-access-from-files
}

# Flash
alias flash_log='tail -f ~/Library/Preferences/Macromedia/Flash\ Player/Logs/flashlog.txt'

# Subversion
alias dsunhook="find . -name '.DS_Store' -exec rm -rf {} \'"
alias sup='svn update'
alias sst='svn status'
alias scom='svn commit'
alias slog='svn log | more'
alias sex='svn export'
alias sd='svn diff \!*'
alias sdd='svn diff -r PREV'

# Git
alias gs='git status'
alias ga='git add'
alias gb='git branch'
alias bga='git branch -a'
alias gc='git commit -v'
alias gco='git checkout'
alias gd='git diff -v | $EDITOR -'
alias gdc='git diff --cached --pretty | $EDITOR -'
alias gdm='git diff master | $EDITOR -'
alias gh='github'
alias gla='git log --author'
alias glg='git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr by %an)%Creset" --abbrev-commit --date=relative'
alias glog='git log --all --graph --decorate'

alias pp='git pull $1 $2 && git push $1 $2'
alias gps='git push'
alias gpl='git pull'
alias gst='git stash'
alias rb='rebase'
alias rbc='rebase --continue'
alias rbs='rebase --skip'
alias rl='reflog'
alias rs='remote show'
alias rt='remote'
alias ru='remote update'
alias rp='remote prune'
alias sm='submodule'

alias fixup='git commit --amend -C HEAD'
alias timeline='git log --graph --branches --pretty=oneline --decorate'
alias untracked-files='ls-files -o --exclude-standard'
alias ignored-files='ls-files --others -i --exclude-standard'
alias modified-files='ls-files -m'

# Shortcut for GIT
function g(){
	if [ -z "$1" ]
  then
    git st
  else
  	git $1
	fi
}

# Commit pending changes and quote all args as message
function gg() {
	git commit -v -a -m "$*"
}

# Search log for 
function gls() {
	git log --grep="$*"
}

# Setup a tracking branch from [remote] [branch_name]
function gbt() {
	git branch --track $2 $1/$2
	git checkout $2
}

# Git Remove File
function grf() {
	rm $1
	git checkout $1
}

# Ruby
alias ss='foreman start -f Procfile'
alias r='rails'
alias sc='rails console'
alias sg='rails generate'
alias sp='rails plugin'
alias irb='irb --readline -r irb/completion'
alias rii='ri -Tf ansi'
alias gemi='sudo gem install -no-rdoc --no-ri'
alias r_sidekiq='bundle exec sidekiq -q default -q fb_page_stream_scraper -q twitter_page_stream_scraper -q fb_ad_stats_scraper -q fb_campaign_populator -q scheduled_post -q fb_ad_campaign_crud -q fb_ad_image,2 -q fb_ads'

# Brunch
alias br='brunch'
alias brs='brunch watch -s'
function bra(){
  if [[ -z $1 ]]
  then
    echo 'Need a file name'
  else
    brunch generate controller $1 && brunch generate model $1 && brunch generate view $1
    echo "Brunch Generate (MVC) '$1'"
  fi
}
function brr(){
  if [[ -z $1 ]]
  then
    echo 'Need a file name'
  else
    brunch destroy controller $1 && brunch destroy model $1 && brunch destroy view $1
    echo "Brunch Destroy (MVC) '$1'"
  fi
}

# MacVim
function mvim(){
	FILE=$1
	if [[ ! -f $FILE ]]; then
		touch $FILE; echo "$FILE created"
	fi
	open -a macvim $FILE
}

# MAC
alias kf='killall Finder'
alias kd='killall Dock'
alias kss='killall SystemUIServer'
alias resetfinder='rm ~/Library/Preferences/com.apple.finder.plist; kf'

# Hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# ScreenCapture format defaults write com.apple.screencapture type jpg
# No Drop Shadow defaults write com.apple.screencapture disable-shadow -bool true
# killall SystemUIServer
# ShowHidden Icon Transparent defaults write com.apple.Dock showhidden -bool YES
# Stack Recent Apps Dock defaults write com.apple.dock persistent-others -array-add '{ "tile-data" = { "list-type" = 1; }; "tile-type" = "recents-tile"; }'
# Extended Print Menu defaults write -g PMPrintingExpandedStateForPrint -bool TRUE
# Extended Save Menu defaults write -g NSNavPanelExpandedStateForSaveMode -bool TRUE
# Show Hidden Files defaults write com.apple.finder AppleShowAllFiles TRUE
# Dock Spaces defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="spacer-tile";}'
# Stop Indexing Spotlight sudo mdutil -a -i off
# Turn Off Spotlight sudo chmod 600 /System/Library/CoreServices/Search.bundle/Contents/MacOS/Search -- killall SystemUIServer
# Expand save panel defaults write -g NSNavPanelExpandedStateForSaveMode -bool true
# Expand print panel defaults write -g PMPrintingExpandedStateForPrint -bool true
# Avoid creating .DS_Store files on network volumes defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
# Fix for the ancient UTF-8 bug in QuickLook (http://mths.be/bbo) echo˚ "0x08000100:0" > ~/.CFUserTextEncoding
# Animate opening and closing of windows defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool NO
# Mail Animations when replying defaults write com.apple.Mail DisableReplyAnimations -bool YES # defaults write com.apple.Mail DisableSendAnimations -bool YES