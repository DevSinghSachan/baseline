package=${1:-"baseline"}
test=${2:-"test"}

rm -rf *.egg*
cp setup_$package.py setup.py
pip install -e .[test]
rm setup.py

if [ $package = "baseline" ]; then
    if [ $test = "test" ]; then
        cd ../test
        pytest
    fi
fi
