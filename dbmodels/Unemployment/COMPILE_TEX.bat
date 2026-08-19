@echo off


for %%f in (*.tex) do (
	del "%~dp0%%~nf.aux"
	del "%~dp0%%~nf.out"
	del "%~dp0%%~nf.toc"
	del "%~dp0%%~nf.bbl"
	pdflatex.exe --shell-escape "%%f"
	bibtex.exe "%~dp0%%~nf"
	pdflatex.exe --shell-escape "%%f"
	pdflatex.exe --shell-escape "%%f"
        start "" /max "%~dp0%%~nf.pdf"
)


pause