@echo on

go build -v -o "%PREFIX%\bin\go-licenses" ^
    exit 2
go-licenses save . --save_path=license-files ^
    exit 3
