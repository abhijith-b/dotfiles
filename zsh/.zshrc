# ── Plugins ───────────────────────────────────────────────────────────────────
#source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
#source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ── History ───────────────────────────────────────────────────────────────────
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt HIST_IGNORE_DUPS SHARE_HISTORY INC_APPEND_HISTORY

# ── Completion ────────────────────────────────────────────────────────────────
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# ── Kubernetes ────────────────────────────────────────────────────────────────
alias k='kubectl'
alias kgp='kubectl get pods'
alias kgpa='kubectl get pods -A'
alias kgs='kubectl get svc'
alias kgn='kubectl get nodes'
alias kgd='kubectl get deployments'
alias kga='kubectl get all'
alias kgaa='kubectl get all -A'
alias kdp='kubectl describe pod'
alias kds='kubectl describe svc'
alias kdn='kubectl describe node'
alias kdd='kubectl describe deployment'
alias kl='kubectl logs'
alias klf='kubectl logs -f'
alias ke='kubectl exec -it'
alias kaf='kubectl apply -f'
alias kdf='kubectl delete -f'
alias kctxs='kubectl config get-contexts'
alias kcur='kubectl config current-context'
# kctx and kns provided by kubectx/kubens
alias kpf='kubectl port-forward'
alias ktop='kubectl top pods'
alias ktopp='kubectl top pods -A'
alias ktopn='kubectl top nodes'
alias kroll='kubectl rollout restart deployment'
alias krs='kubectl rollout status deployment'
alias k9='k9s'

# ── Docker ────────────────────────────────────────────────────────────────────
alias d='docker'
alias dps='docker ps'
alias dpsa='docker ps -a'
alias di='docker images'
alias drm='docker rm'
alias drmi='docker rmi'
alias dex='docker exec -it'
alias dl='docker logs'
alias dlf='docker logs -f'
alias dsp='docker system prune -f'
alias dspa='docker system prune -af --volumes'
alias dco='docker compose'
alias dcou='docker compose up -d'
alias dcod='docker compose down'
alias dcol='docker compose logs -f'
alias dcops='docker compose ps'

# ── AWS ───────────────────────────────────────────────────────────────────────
alias awswho='aws sts get-caller-identity'
alias awsprofile='export AWS_PROFILE'
alias ecrl='aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin'
alias s3ls='aws s3 ls'
alias s3cp='aws s3 cp'

# ── Azure ─────────────────────────────────────────────────────────────────────
alias azwho='az account show'
alias azls='az account list --output table'
alias azset='az account set --subscription'
alias acrlogin='az acr login --name'

# ── Terraform / Tofu ──────────────────────────────────────────────────────────
alias tf='terraform'
alias tfi='terraform init'
alias tfp='terraform plan'
alias tfa='terraform apply'
alias tfaa='terraform apply -auto-approve'
alias tfd='terraform destroy'
alias tfda='terraform destroy -auto-approve'
alias tfo='terraform output'
alias tfw='terraform workspace'
alias tfws='terraform workspace select'
alias tfwl='terraform workspace list'

# ── Git ───────────────────────────────────────────────────────────────────────
alias g='git'
alias gs='git status'
alias ga='git add'
alias gaa='git add -A'
alias gc='git commit -m'
alias gp='git push'
alias gpl='git pull'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gl='git log --oneline --graph --decorate -15'
alias gd='git diff'
alias gds='git diff --staged'
alias gst='git stash'
alias gstp='git stash pop'

# ── System / Fedora ───────────────────────────────────────────────────────────
alias update='sudo dnf upgrade -y'
alias install='sudo dnf install -y'
alias remove='sudo dnf remove -y'
alias search='dnf search'
alias ports='ss -tulpn'
alias myip='curl -s ifconfig.me'
alias path='echo $PATH | tr ":" "\n"'
alias reload='source ~/.zshrc'
alias zshrc='$EDITOR ~/.zshrc'
alias starshipcfg='$EDITOR ~/.config/starship.toml'
alias ll='ls -lah --color=auto'
alias la='ls -A'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# ── Helpers ───────────────────────────────────────────────────────────────────
aliases() { grep -E '^alias ' ~/.zshrc | sed "s/alias //" | column -t -s '=' }

listening() { ss -tulpn | grep ":$1" }

b64e() { echo -n "$1" | base64 }
b64d() { echo -n "$1" | base64 -d }

ksecret() { kubectl get secret "$1" -o jsonpath="{.data.$2}" | base64 -d; echo }

kubecfg() { export KUBECONFIG="$1"; echo "KUBECONFIG set to $1" }

# ── fzf ───────────────────────────────────────────────────────────────────────
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
# Ctrl+R: fuzzy history | Ctrl+T: fuzzy file | Alt+C: fuzzy cd
[[ -f /usr/share/fzf/shell/key-bindings.zsh ]] && source /usr/share/fzf/shell/key-bindings.zsh
[[ -f /usr/share/fzf/shell/completion.zsh   ]] && source /usr/share/fzf/shell/completion.zsh

# ── Starship ──────────────────────────────────────────────────────────────────
eval "$(starship init zsh)"
