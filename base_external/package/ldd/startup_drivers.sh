LOGFILE_SCULL="/var/log/scull.log"

start() {
    echo "Loading scull"
    date >> $LOGFILE_SCULL 2>&1 &
    scull_load.sh >> $LOGFILE_SCULL 2>&1 &

    echo "Loading misc"
    module_load.sh faulty
    module_load.sh hello
}

stop() {
    echo "Stopping scull"
    date >> $LOGFILE_SCULL 2>&1 &
    scull_unload.sh >> $LOGFILE_SCULL 2>&1 &

    echo "Stopping misc"
    module_unload.sh faulty
    module_unload.sh hello
}


case "$1" in
    start)
        start
        ;;
    stop)
        stop
        ;;
    *)
        echo "To use: $0 {start|stop}"
        exit 1
        ;;
esac