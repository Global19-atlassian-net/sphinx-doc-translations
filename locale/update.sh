export SPHINXINTL_TRANSIFEX_PROJECT_NAME=sphinx-doc-1_2_0

cd `dirname $0`
rm -R pot
sphinx-build -b gettext ../sphinx/doc pot
sphinx-intl update-txconfig-resources -p pot -d .
rm -R es ja pt_BR
tx pull -l es,ja,pt_BR
git checkout .tx/config

# sphinx-1.2.x doesn't support auto mo build
sphinx-intl build -d .

