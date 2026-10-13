# Установка набора навыков Claude Code на Windows.
# Копирует навыки в %USERPROFILE%\.claude\skills.
# Уже стоящие не трогает, если не передать -Force.

param([switch]$Force)

$ErrorActionPreference = "Stop"
try { [Console]::OutputEncoding = [System.Text.Encoding]::UTF8 } catch {}

$src  = Join-Path $PSScriptRoot "skills"
$dest = Join-Path $HOME ".claude\skills"

if (-not (Test-Path $src)) {
    Write-Host "Не нашёл папку skills рядом со скриптом."
    exit 1
}
if (-not (Test-Path $dest)) { New-Item -ItemType Directory -Path $dest -Force | Out-Null }

$added = 0; $skipped = 0; $updated = 0
foreach ($d in Get-ChildItem -Path $src -Directory) {
    $target = Join-Path $dest $d.Name
    if (Test-Path $target) {
        if ($Force) {
            Remove-Item $target -Recurse -Force
            Copy-Item $d.FullName $target -Recurse
            $updated++
        } else { $skipped++ }
    } else {
        Copy-Item $d.FullName $target -Recurse
        $added++
    }
}

$total = (Get-ChildItem -Path $dest -Directory).Count
Write-Host ""
Write-Host "Готово."
Write-Host "  поставлено новых:     $added"
if ($updated -gt 0) { Write-Host "  обновлено:            $updated" }
if ($skipped -gt 0) {
    Write-Host "  пропущено (уже были): $skipped"
    Write-Host "  чтобы перезаписать своими — запусти ещё раз с ключом -Force"
}
Write-Host "  всего навыков теперь: $total"
Write-Host ""
Write-Host "Перезапусти Claude Code, чтобы он их увидел."
