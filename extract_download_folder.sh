extractDownloadFolder() {
    downloadUrl="$1"
    filename=$(basename "$downloadUrl")
    path="$HOME/Documentos/packages_test"

    cd $path
    curl -o "$filename" -L "$downloadUrl"
    tar -xvf "$filename"
}