
exitfn () {
    echo; echo 'Stopping docker...'
    docker stop ccydb > /dev/null
    docker rm ccydb > /dev/null
}

fail () {
    exitfn
    exit 2
}

trap "fail" 2

docker run --name ccydb -e POSTGRES_USER=postchain \
    -e POSTGRES_PASSWORD=postchain -p 5432:5432 \
    -d postgres:16.3-alpine3.20 > /dev/null


chr node start --wipe

exitfn
