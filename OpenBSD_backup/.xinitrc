GTK_IM_MODULE=uim; export GTK_IM_MOUDLE
QT_IM_MODULE=uim; export QT_IM_MOUDLE
XMODIFIERS=@im=uim; export XMODIFIERS


uim-xim &

GTK_IM_MOUDLE_FILE=/etc/gtk-2.0/gtk.immodules
export GTK_IM_MOUDLE_FILE

uim-toolbar-gtk-systray &


/usr/local/bin/startxfce4 --with-ck-launch
