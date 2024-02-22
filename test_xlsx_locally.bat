@echo off
rem This script runs the key steps from the gh-action pipeline locally
rem which may help to spot problems before submitting an exlsx file
rem in a pull request. Using this script is completely optional.
rem Make sure you have voc4cat-tool installed (https://pypi.org/project/voc4cat/)

rem check inbox file names
voc4cat check --config idranges.toml --logfile outbox/voc4cat.log --ci-pre inbox-excel-vocabs/ vocabularies

rem check xlsx file(s). If the check fails, write annotated file to outbox.
voc4cat check --config idranges.toml --logfile outbox/voc4cat.log --outdir outbox inbox-excel-vocabs/

rem convert file(s) from xlsx in inbox to turtle in outbox
voc4cat convert --config idranges.toml --logfile outbox/voc4cat.log --outdir outbox inbox-excel-vocabs/

rem post-convert checks of all ttl file(s) in outbox
voc4cat check --config idranges.toml --logfile outbox/voc4cat.log outbox/

rem build HTML documentation
voc4cat docs --logfile outbox/voc4cat.log --force outbox/

rem Split vocabulary and merge into vocabulary dir (in PR branch)
voc4cat transform --split --inplace --logfile outbox/voc4cat.log --outdir outbox_new_voc outbox/
