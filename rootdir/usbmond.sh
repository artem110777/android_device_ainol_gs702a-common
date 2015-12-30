#!/system/bin/sh
param1=$1
param2=$2
install=insmod
uninstall=rmmod
setproperty=setprop

adb_exist=1

usb_gandroid0_enable="/sys/class/android_usb/android0/enable"
i=1
echo "usbmond shell: $param1 $param2"

if [ x$param1 = xUSB_B_IN ]; then
    if [ "$param2" = "$adb_exist" ]; then
      echo "------adbd stop in B_IN" > /dev/console
      /system/bin/stop adbd
      sleep 1
    fi
    echo "force to uninstall dummy ko."
    i=1
    until [ ! "$i" -le 4 ]
    do
        echo "------num is $i"  > /dev/console
        i=$((i+1))
        if [ -z `busybox pgrep -x adbd` ]; then
            echo "------adbd not exist" > /dev/console
            i=100;
        else
            echo "------adbd still exist" > /dev/console
            /system/bin/stop adbd
            sleep 1
        fi
    done
    echo "------force to uninstall g_android." > /dev/console
    $uninstall g_android
    i=1
    until [ ! "$i" -le 3 ]
    do
        echo "------udc_num is $i"  > /dev/console
        if [ -f "$usb_gandroid0_enable" ]; then
            i=$((i+1))
            echo "------g_android not uninstall" > /dev/console
            sleep 1
            $uninstall g_android
        else
            i=100;
            echo "------g_android uninstalled" > /dev/console
        fi
    done
    echo "------force to uninstall dummy udc." > /dev/console
    $uninstall dummy_udc
    $uninstall dwc3_actions
    $uninstall dwc3

    $install /misc/modules/dwc3.ko
    $install /misc/modules/dwc3-actions.ko
    $install /misc/modules/g_android.ko
    if [ "$param2" = "$adb_exist" ]; then
      echo "------adb start in B_IN" > /dev/console
      /system/bin/start adbd
    fi  
fi

if [ x$param1 = xUSB_B_OUT ];then
    if [ "$param2" = "$adb_exist" ];then
      echo "------adb stop in B_OUT" > /dev/console 
      /system/bin/stop adbd
      sleep 1
    fi  
    i=1
    until [ ! "$i" -le 4 ]
    do   
        echo "------out_num is $i"  > /dev/console 
        i=$((i+1)) 
        if [ -z `busybox pgrep -x adbd` ]; then
            echo "------adbd not exist" > /dev/console    
            i=100
        else
            echo "------adbd still exist" > /dev/console
            /system/bin/stop adbd
            sleep 1
        fi
    done
    $uninstall g_android
    $uninstall dwc3_actions
    $uninstall dwc3

    $install /misc/modules/dummy_udc.ko
    $install /misc/modules/g_android.ko

    if [ "$param2" = "$adb_exist" ]; then
      echo "------start stop in B_OUT" > /dev/console
      /system/bin/start adbd
      sleep 1
    fi
fi

if [ x$param1 = xUSB_A_IN ]; then
    if [ -z `busybox pgrep rild` ]; then
       echo "------start rild" > /dev/console
        /system/bin/start ril-daemon
        sleep 1
    fi
    $install /misc/modules/dwc3.ko host_config=1
    $install /misc/modules/dwc3-actions.ko
    $install /misc/modules/xhci-hcd.ko
fi

if [ x$param1 = xUSB_A_OUT ]; then
    $uninstall xhci_hcd
    $uninstall dwc3_actions
    $uninstall dwc3
fi

if [ x$param1 = xUSB20PORT0_B_IN ]; then
    if [ "$param2" = "$adb_exist" ]; then
      /system/bin/stop adbd
      sleep 1
    fi
    echo "force to uninstall dummy ko."
    $uninstall g_android
    $uninstall dummy_udc
    $uninstall udc

    $install /misc/modules/udc.ko
    $install /misc/modules/g_android.ko
    if [ "$param2" = "$adb_exist" ]; then
      /system/bin/start adbd
    fi
fi

if [ x$param1 = xUSB20PORT0_B_OUT ]; then
    if [ "$param2" = "$adb_exist" ]; then
      /system/bin/stop adbd
      sleep 1
    fi
    $uninstall g_android
    $uninstall udc
    
    $install /misc/modules/dummy_udc.ko
    $install /misc/modules/g_android.ko
fi
