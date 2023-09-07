extractDownloadFolder() {
    downloadUrl="$1"
    filename="$2"
    path="$HOME/Documentos/packages_test"

    cd $path
    wget "$downloadUrl"
    tar -xvf $filename
}