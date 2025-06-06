oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/gruvbox.omp.json" | Invoke-Expression
Import-Module -Name Terminal-Icons
Import-Module posh-git

New-Alias g git
function glog {
    & git log --pretty=format:"%Cgreen%h %Creset%cd %Cblue[%cn] %Creset%s%C(yellow)%d%C(reset)" --graph --date=relative --decorate --all
}
function gaac {
    & git add -A
    & git commit -m $args
}
function gs {
    & git status
}
function gco {
    & git checkout $args
}
function gaa {
    & git add -A
}
function gd {
    & git diff $args
}
function gpr {
    param (
        [string]$base = "master",
        [string]$title = ""
    )

    $templatePath = ".github/PULL_REQUEST_TEMPLATE.md"

    if (-not $title) {
        $title = git log -1 --pretty=format:"%s"
    }

    if (Test-Path $templatePath) {
        # Copy the template so user can modify it before submission
        $prBodyPath = "$env:TEMP\gpr_body_$(Get-Random).md"
        Copy-Item $templatePath $prBodyPath

        # Open the PR body in an editor
        code $prBodyPath
        Read-Host "Edit the PR body, then press ENTER to continue"

        # Submit PR with edited template
        gh pr create --base $base --title "$title" --body-file "$prBodyPath"
    }
    else {
        Write-Host "PR template not found — submitting with default body via --fill"
        gh pr create --base $base --title "$title" --fill
    }
}
function rundotnet {
    param (
        [string]$projectPath = ".\src\Web"
    )

    if (-not (Test-Path $projectPath)) {
        Write-Host "Project path '$projectPath' does not exist."
        return
    }

    dotnet watch run --project $projectPath
}
