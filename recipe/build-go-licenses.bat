@echo on

go build -v -o "%PREFIX%\bin\go-licenses.exe" ^
    || exit 2

if "%target_platform%" == "win-arm64" (
    rem Build for win-64 as this can also be run in cross-compilation mode.
    setlocal
    set "GOARCH=amd64"
    go build -v -o go-licenses-native.exe ^
        || exit 3
    endlocal
    go-licenses-native.exe save . --save_path=license-files ^
        || exit 4
) else (
    "%PREFIX%\bin\go-licenses.exe" save . --save_path=license-files ^
        || exit 5
)
