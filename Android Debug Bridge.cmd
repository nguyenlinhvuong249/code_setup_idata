rem ========== SETUP BY TOOLS ================================================================================================================
    @echo off
    setlocal EnableDelayedExpansion
    cd G:\DATA\File_tools\platform-tools
    rem set PATH=%PATH%;%~dp0\platform-tools
    set PATH=%PATH%;G:\DATA\File_tools\platform-tools
    Android Debug Bridge (ADB) tools
    rem color 02 chuyển màu chữ thành xanh
    adb start-server
    rem adb shell am start -n com.idata.iscanv2/com.idata.iscanv2.MainActivity mở ứng dụng quét mã vạch trên k1s
    rem bạn hãy thay đổi và pass wifi tại đây ================================================================================================
                set duong_dan_app_ban_cu=G:\DATA\File_apk\JTSprinter_version\JTSprinter1.1.95.apk
                set duong_dan_app_ban_moi=G:\DATA\File_apk\JTSprinter_version\JTSprinter1.1.103.apk
                set packages_name_JT_cu=cn.yssoft.vietnam
                set packages_name_JT_cu_autoid_Q9=cn.yssoft.philippines
            rem pass wifi J&T Expreess Office
                set pass_wifi_jt_expreess_office=Jtexpress2024!@#++
            rem pass wifi J&T Expreess Guest
                set pass_wifi_JT_Expreess_Guest=Jtexpress@2024++$
    rem ======================================================================================================================================
    FOR %%a IN (%duong_dan_app_ban_cu%) DO SET JTSprinter_version_cu=%%~na
    FOR %%a IN (%duong_dan_app_ban_moi%) DO SET JTSprinter_version_new=%%~na
rem ==========================================================================================================================================

rem ============== LENH DUOC BUIL SAN ========================================================================================================
    rem ============== mainmenu ==============================================================================================================
        cls
        :mainmenu
        echo.
        echo.
        echo.
        echo ========================= MENU CHINH =======================
        echo.
        echo.
        echo  1: Idata K1S
        echo  2: Idata AUTOID Q9
        echo.
        echo 00: THOAT
        echo.
        echo.
        set /p mainmenu=" VUI LONG NHAP LUA CHON CUA BAN :   "
        set compare_result=findstr /i "LUA CHON MONG MUON" "%mainmenu%"
            if %mainmenu%==1 (
                rem đến menu idata K1S
                cls
                goto menu_K1S
            ) else if %mainmenu%==2 (
                rem đến menu idata autoid Q9
                cls
                goto menu_autoid_Q9
            ) else if "%mainmenu%"=="limit_off" (
                cls
                color 02
                goto limit_off
            ) else if %mainmenu%==00 (
                rem thoát
                exit
            ) else (
                cls
                echo.
                echo.
                echo                LUA CHON BAN NHAP VAO KHONG HOP LE
                echo                        VUI LONG NHAP LAI !
                goto mainmenu
            )

    rem ======================================================================================================================================
        rem ============== 1. menu_K1S =======================================================================================================
            cls
            :menu_K1S
            echo.
            echo.
            echo.
            echo ========================= IDATA K1S =======================
            echo.
            echo.           
            echo  1:  liet ke thiep bi dang ket noi
            echo  2:  Bat / Tat WIFI 
            echo  3:  Cai dat giay tren thanh trang thai
            echo  4:  SETUP mui gio va ngon ngu
            echo  5:  Cai dat ung dung
            echo  6:  An / Hien ung dung khong can Thiet
            echo  7:  Xoa ung dung ( ke ca mac dinh ) khoi thiep bi
            echo  8:  Hien ten goi cua ung 
            echo  9:  Nhap Password WIFI
            echo 10:  AUTO SETUP IDATA (*)
            echo 11:  Restart lai thiep bi
            echo.
            echo  0:  QUAY LAI
            echo 00:  THOAT
            echo.
            echo.
            set /p menu_IDATA_k1s=" VUI LONG NHAP LUA CHON CUA BAN :   "
                if %menu_IDATA_k1s%==1 (
                    rem liet ke thiep bi dang ket noi
                    cls
                    goto menu_adb_devices
                ) else if %menu_IDATA_k1s%==2 (
                    rem Bat / Tat WIFI
                    cls
                    goto menu_wifi
                ) else if %menu_IDATA_k1s%==3 (
                    rem cài giây trên thanh thông báo
                    cls
                    goto menu_cai_giay
                ) else if %menu_IDATA_k1s%==4 (
                    rem cài múi giờ và ngôn ngữ
                    cls
                    goto menu_set_time_zone_and_language
                ) else if %menu_IDATA_k1s%==5 (
                    rem cài đặt ứng dụng
                    cls
                    goto menu_install_app
                ) else if %menu_IDATA_k1s%==6 (
                    rem ẩn / hiện ứng dụng
                    cls
                    goto menu_hidden_show_app
                ) else if %menu_IDATA_k1s%==7 (
                    rem xóa ứng dụng mặc định
                    cls
                    goto menu_delete_app
                ) else if %menu_IDATA_k1s%==8 (
                    rem hiện tên gói ứng dụng
                    cls
                    goto menu_ten_goi
                ) else if %menu_IDATA_k1s%==9 (
                    rem nhập pass wifi vào ô
                    cls
                    goto menu_pass_wifi
                ) else if %menu_IDATA_k1s%==10 (
                    rem chạy auto toàn bộ
                    cls
                    goto menu_auto_run_k1s
                ) else if %menu_IDATA_k1s%==11 (
                    rem Restart thiếp bị
                    cls
                    goto menu_restart
                ) else if %menu_IDATA_k1s%==0 (
                    rem quay lại menu chính
                    cls
                    goto mainmenu
                ) else if %menu_IDATA_k1s%==00 (
                    rem thoát
                    exit
                ) else (
                    cls
                    echo.
                    echo.
                    echo                LUA CHON BAN NHAP VAO KHONG HOP LE
                    echo                        VUI LONG NHAP LAI !
                    goto menu_K1S
                )

        rem ==================================================================================================================================
            rem ============== 1.1 menu_adb_devices ==========================================================================================
                :menu_adb_devices
                 adb devices -l
                 adb get-serialno
                echo.
                echo.
                echo.
                echo ============================================================
                echo.
                echo.
                echo.
                echo  0:  QUAY LAI
                echo 00:  THOAT
                echo.
                echo.
                set /p menu_adb_devices=" VUI LONG NHAP LUA CHON CUA BAN :   "
                    if %menu_adb_devices%==0 (
                        rem quay lại menu chính
                        cls
                        goto menu_K1S
                    ) else if %menu_adb_devices%==00 (
                        rem thoát
                        exit
                    ) else (
                        cls
                        echo.
                        echo.
                        echo                LUA CHON BAN NHAP VAO KHONG HOP LE
                        echo                        VUI LONG NHAP LAI !
                        goto menu_adb_devices
                    )

            rem ==============================================================================================================================
            rem ============== 1.2 menu_wifi =================================================================================================
                :menu_wifi
                echo.
                echo.
                echo.
                echo ============================================================
                echo.
                echo.
                echo  1:  BAT WIFI
                echo  2:  TAT WIFI
                echo.
                echo  0:  QUAY LAI
                echo 00:  THOAT
                echo.
                echo.
                set /p menu_wifi=" VUI LONG NHAP LUA CHON CUA BAN :   "                   
                    if %menu_wifi%==1 (
                        rem bật wifi
                        cls
                         adb shell svc wifi enable
                        goto menu_back_menu_wifi
                    ) else if %menu_wifi%==2 (
                        rem tắt wifi
                        cls
                         adb shell svc wifi disable
                        goto menu_back_menu_wifi
                    ) else if %menu_wifi%==0 (
                        rem quay lại menu chính
                        cls
                        goto menu_K1S
                    ) else if %menu_wifi%==00 (
                        rem thoát
                        exit
                    ) else (
                        cls
                        echo.
                        echo.
                        echo                LUA CHON BAN NHAP VAO KHONG HOP LE
                        echo                        VUI LONG NHAP LAI !
                        goto menu_wifi
                    )

            rem ==============================================================================================================================
                rem ============== 1.2.1 menu_back_menu ======================================================================================
                    :menu_back_menu_wifi
                    echo.
                    echo.
                    echo.
                    echo ======================= HOAN THANH ! =======================
                    echo.
                    echo.
                    echo.
                    echo  0:  QUAY LAI
                    echo 00:  THOAT
                    echo.
                    echo.
                    set /p menu_back_menu_wifi=" VUI LONG NHAP LUA CHON CUA BAN :   "
                        if %menu_back_menu_wifi%==0 (
                            rem quay lại menu chính
                            cls
                            goto menu_wifi
                        ) else if %menu_back_menu_wifi%==00 (
                            rem thoát
                            exit
                        ) else (
                            cls
                            echo.
                            echo.
                            echo                LUA CHON BAN NHAP VAO KHONG HOP LE
                            echo                        VUI LONG NHAP LAI !
                            goto menu_back_menu_wifi
                        )

                rem ==========================================================================================================================
            rem ============== 1.3 menu_cai_giay =============================================================================================
                :menu_cai_giay
                echo.
                echo.
                echo.
                echo ============================================================
                echo.
                echo.
                echo  1:  BAT GIAY TREN THANH THONG BAO
                echo  2:  TAT GIAY TREN THANH THONG BAO
                echo.
                echo  0:  QUAY LAI
                echo 00:  THOAT
                echo.
                echo.
                set /p menu_cai_giay=" VUI LONG NHAP LUA CHON CUA BAN :   "
                    if %menu_cai_giay%==1 (
                        rem cài giây trên thanh thông báo
                        cls
                         adb shell settings put secure clock_seconds 1
                        goto menu_back_menu_cai_giay
                    ) else if %menu_cai_giay%==2 (
                        rem tắt giây trên thanh thông báo
                        cls
                         adb shell settings put secure clock_seconds 0
                        goto menu_back_menu_cai_giay
                    ) else if %menu_cai_giay%==0 (
                        rem quay lại menu chính
                        cls
                        goto menu_K1S
                    ) else if %menu_cai_giay%==00 (
                        rem thoát
                        exit
                    ) else (
                        cls
                        echo.
                        echo.
                        echo                LUA CHON BAN NHAP VAO KHONG HOP LE
                        echo                        VUI LONG NHAP LAI !
                        goto menu_cai_giay
                    )

            rem ==============================================================================================================================
                rem ============== 1.3.1 menu_back_menu ======================================================================================
                    :menu_back_menu_cai_giay
                    echo.
                    echo.
                    echo.
                    echo ======================= HOAN THANH ! =======================
                    echo.
                    echo.
                    echo.
                    echo  0:  QUAY LAI
                    echo 00:  THOAT
                    echo.
                    echo.
                    set /p menu_back_menu_cai_giay=" VUI LONG NHAP LUA CHON CUA BAN :   "
                        if %menu_back_menu_cai_giay%==0 (
                            rem quay lại menu chính
                            cls
                            goto menu_cai_giay
                        ) else if %menu_back_menu_cai_giay%==00 (
                            rem thoát
                            exit
                        ) else (
                            cls
                            echo.
                            echo.
                            echo                LUA CHON BAN NHAP VAO KHONG HOP LE
                            echo                        VUI LONG NHAP LAI !
                            goto menu_back_menu_cai_giay
                        )

                rem ==========================================================================================================================
            rem ============== 1.4 menu_set_time_zone_and_language ===========================================================================
                    :menu_set_time_zone_and_language
                    echo.
                    echo.
                    echo.
                    echo ============================================================
                    echo.
                    echo.
                    echo  1:  CAI DAT MUI GIO VIET NAM
                    echo  2:  CAI DAT NGON NGU TIENG VIET
                    echo  3:  RESTART
                    echo.
                    echo  0:  QUAY LAI
                    echo 00:  THOAT
                    echo.
                    echo.
                    set /p menu_set_time_zone_and_language=" VUI LONG NHAP LUA CHON CUA BAN :   "
                        if %menu_set_time_zone_and_language%==1 (
                            rem cài đặt múi giờ VN
                            cls
                             adb shell service call alarm 3 s16 Asia/Ho_Chi_Minh
                            goto menu_back_menu_set_time_zone_and_language
                        ) else if %menu_set_time_zone_and_language%==2 (
                            rem cài đặt ngôn ngữ TV
                            cls
                             adb shell content query --uri content://settings/system --where "name=\'system_locales\'"
                             adb shell content delete --uri content://settings/system --where "name=\'system_locales\'"
                             adb shell content insert --uri content://settings/system --bind name:s:system_locales --bind value:s:vi-VN
                            goto menu_back_menu_set_time_zone_and_language
                        ) else if %menu_set_time_zone_and_language%==3 (
                            rem restart
                            cls
                             adb reboot
                            goto menu_back_menu_set_time_zone_and_language
                        ) else if %menu_set_time_zone_and_language%==0 (
                            rem quay lại menu chính
                            cls
                            goto menu_K1S 
                        ) else if %menu_set_time_zone_and_language%==00 (
                            rem thoát
                            exit
                        ) else (
                            cls
                            echo.
                            echo.
                            echo                LUA CHON BAN NHAP VAO KHONG HOP LE
                            echo                        VUI LONG NHAP LAI !
                            goto menu_set_time_zone_and_language
                        )

            rem ==============================================================================================================================
                rem ============== 1.4.1 menu_back_menu_set_time_zone_and_language ===========================================================
                    :menu_back_menu_set_time_zone_and_language
                    cls
                    echo.
                    echo.
                    echo.
                    echo ======================= HOAN THANH ! =======================
                    echo *********************** LUU Y !!!!!! ***********************
                    echo          VUI LONG VAO MENU 3 DE CAI DAT CO HIEU LUC
                    echo.
                    echo.
                    echo  0:  QUAY LAI
                    echo 00:  THOAT
                    echo.
                    echo.
                    set /p menu_back_menu_set_time_zone_and_language=" VUI LONG NHAP LUA CHON CUA BAN :   "
                        if %menu_back_menu_set_time_zone_and_language%==0 (
                            rem quay lại menu chính
                            cls
                            goto menu_set_time_zone_and_language
                        ) else if %menu_back_menu_set_time_zone_and_language%==00 (
                            rem thoát
                            exit
                        ) else (
                            cls
                            echo.
                            echo.
                            echo                LUA CHON BAN NHAP VAO KHONG HOP LE
                            echo                        VUI LONG NHAP LAI !
                            goto menu_back_menu_set_time_zone_and_language
                        )

                rem ==========================================================================================================================
            rem ============== 1.5 menu_install_app (*) ======================================================================================
                :menu_install_app
                echo.
                echo.
                echo.
                echo ============================================================
                echo.
                echo.
                echo  1:  GO CAI DAT APP JT SPRINTER BAN CU (*)
                echo  2:  CAI DAT APP JT SPRINTER BAN CU   [%JTSprinter_version_cu%] (*)
                echo  3:  CAI DAT APP JT SPRINTER BAN MOI   [%JTSprinter_version_new%] (*)
                echo  4:  GO CAI DAT BAN MOI (*)
                echo  5:  CAI DAT APP KHAC
                echo  6:  GO CAI DAT APP KHAC
                echo.
                echo  0:  QUAY LAI
                echo 00:  THOAT
                echo.
                echo.
                set /p menu_install_app=" VUI LONG NHAP LUA CHON CUA BAN :   "
                    if %menu_install_app%==1 (
                        rem GO CAI DAT APP JT SPRINTER BAN CU
                        cls
                         adb uninstall "%packages_name_JT_cu%"
                         rem adb uninstall cn.yssoft.vietnam
                        goto menu_back_menu_install_app
                    ) else if %menu_install_app%==2 (
                        rem cài đặt ứng dụng JT SPRINTER bản củ
                        cls
                         adb install -r "%duong_dan_app_ban_cu%"
                        goto menu_back_menu_install_app
                    ) else if %menu_install_app%==3 (
                        rem cài đặt ứng dụng JT SPRINTER bản mới
                        cls
                         adb install -r "%duong_dan_app_ban_moi%"
                    ) else if %menu_install_app%==4 (
                        rem gỡ cài đặt ứng dụng mới
                        cls
                         adb uninstall com.jt.express.vietnam.outfield
                    ) else if %menu_install_app%==5 (
                        rem CAI DAT APP KHAC
                        cls
                        goto menu_back_menu_install_another_app
                    ) else if %menu_install_app%==6 (
                        rem gỡ cài đặt app khác
                        cls
                        goto menu_back_menu_uninstall_another_app
                    ) else if %menu_install_app%==0 (
                        rem quay lại menu chính
                        cls
                        goto menu_K1S 
                    ) else if %menu_install_app%==00 (
                        rem thoát
                        exit
                    ) else (
                        cls
                        echo.
                        echo.
                        echo                LUA CHON BAN NHAP VAO KHONG HOP LE
                        echo                        VUI LONG NHAP LAI !
                        goto menu_install_app
                    )

            rem ==============================================================================================================================
                rem ============== 1.5.1 menu_back_menu_install_app ==========================================================================
                    :menu_back_menu_install_app                           
                    echo.
                    echo.
                    echo.
                    echo ======================= HOAN THANH ! =======================
                    echo *********************** LUU Y !!!!!! ***********************
                    echo.
                    echo.
                    echo.
                    echo  0:  QUAY LAI
                    echo 00:  THOAT
                    echo.
                    echo.
                    set /p menu_back_menu_install_app=" VUI LONG NHAP LUA CHON CUA BAN :   "
                        if %menu_back_menu_install_app%==0 (
                            rem quay lại menu chính
                            cls
                            goto menu_install_app
                        ) else if %menu_back_menu_install_app%==00 (
                            rem thoát
                            exit
                        ) else (
                            cls
                            echo.
                            echo.
                            echo                LUA CHON BAN NHAP VAO KHONG HOP LE
                            echo                        VUI LONG NHAP LAI !
                            goto menu_back_menu_install_app
                        )

                rem ==========================================================================================================================
                rem ============== 1.5.2 menu_back_menu_install_another_app ==================================================================
                    :menu_back_menu_install_another_app
                    cls
                    echo.
                    echo.
                    echo VUI LONG NHAP DUONG DAN CUA UNG DUNG BAN MUON CAI DAT
                    echo      * NHAP 'back' DE QUAY LAI
                    echo      * NHAP 'exit' DE THOAT
                    echo.
                    set /p install_another_app="path install: "
                        if "%install_another_app%"=="back" (
                            cls
                            goto menu_install_app
                        ) else if "%install_another_app%"=="exit" (
                            cls
                            exit
                        ) else (
                                adb install  "%install_another_app%"
                            if ERRORLEVEL 1 (
                                cls
                                echo LOI: Khong the cai dat ung dung. Vui long kiem tra duong dan hoac thu lai.
                                goto menu_back_menu_install_another_app
                            ) else (
                                echo.
                                echo.
                                echo         ********** Ung dung da duoc cai dat thanh cong **********
                            )
                            goto menu_back_menu_install_another_app_done
                        )

                rem ==========================================================================================================================
                    rem ============== 1.5.2.1 menu_back_menu_install_another_app_done =======================================================
                        :menu_back_menu_install_another_app_done
                        echo.
                        echo ============================================================
                        echo.
                        echo.
                        echo  1:  TIEP TUC
                        echo.
                        echo  0:  QUAY LAI
                        echo 00:  THOAT
                        set /p menu_back_menu_install_another_app_done=" VUI LONG NHAP LUA CHON CUA BAN :   "
                            if %menu_back_menu_install_another_app_done%==1 (
                                rem tiếp tục nhập tiếp
                                cls
                                goto menu_back_menu_install_another_app
                            ) else if %menu_back_menu_install_another_app_done%==0 (
                                rem quay lại menu chính
                                cls
                                goto menu_install_app
                            ) else if %menu_back_menu_install_another_app_done%==00 (
                                rem thoát
                                exit
                            ) else (
                                cls
                                echo.
                                echo.
                                echo                LUA CHON BAN NHAP VAO KHONG HOP LE
                                echo                        VUI LONG NHAP LAI !
                                goto menu_back_menu_install_another_app_done
                            )

                    rem ======================================================================================================================
                rem ============== 1.5.3 menu_back_menu_uninstall_app ========================================================================
                    :menu_back_menu_uninstall_app                           
                    echo.
                    echo.
                    echo.
                    echo ======================= HOAN THANH ! =======================
                    echo *********************** LUU Y !!!!!! ***********************
                    echo.
                    echo.
                    echo.
                    echo  0:  QUAY LAI
                    echo 00:  THOAT
                    echo.
                    echo.
                    set /p menu_back_menu_uninstall_app=" VUI LONG NHAP LUA CHON CUA BAN :   "
                        if %menu_back_menu_uninstall_app%==0 (
                            rem quay lại menu chính
                            cls
                            goto menu_install_app
                        ) else if %menu_back_menu_uninstall_app%==00 (
                            rem thoát
                            exit
                        ) else (
                            cls
                            echo.
                            echo.
                            echo                LUA CHON BAN NHAP VAO KHONG HOP LE
                            echo                        VUI LONG NHAP LAI !
                            goto menu_back_menu_uninstall_app
                        )

                rem ==========================================================================================================================
                rem ============== 1.5.4 menu_back_menu_uninstall_another_app ================================================================
                    :menu_back_menu_uninstall_another_app
                    cls
                     adb shell pm list packages -3
                    echo ************************************************************
                    echo.
                    echo.
                    echo VUI LONG NHAP PACKAGES NAME CUA UNG DUNG BAN MUON GO CAI DAT
                    echo      * NHAP 'back' DE QUAY LAI
                    echo      * NHAP 'exit' DE THOAT
                    echo.
                    set /p uninstall_another_app="packages name uninstall: "
                        if "%uninstall_another_app%"=="back" (
                            cls
                            goto menu_install_app
                        ) else if "%uninstall_another_app%"=="exit" (
                            cls
                            exit
                        ) else (
                                adb shell pm list packages -3
                            echo ************************************************************
                                adb uninstall "%uninstall_another_app%"
                            if ERRORLEVEL 1 (
                                cls
                                echo LOI: Khong the go cai dat ung dung. Vui long kiem tra packages name hoac thu lai.
                                goto menu_back_menu_uninstall_another_app
                            ) else (
                                echo.
                                echo.
                                echo         ********** Ung dung da duoc go cai dat thanh cong **********
                            )
                            goto menu_back_menu_uninstall_another_app_done
                        )

                rem ==========================================================================================================================
                    rem ============== 1.5.4.1 menu_back_menu_uninstall_another_app_done =====================================================
                        :menu_back_menu_uninstall_another_app_done
                        echo.
                        echo ============================================================
                        echo.
                        echo.
                        echo  1:  TIEP TUC
                        echo.
                        echo  0:  QUAY LAI
                        echo 00:  THOAT
                        set /p menu_back_menu_uninstall_another_app_done=" VUI LONG NHAP LUA CHON CUA BAN :   "
                            if %menu_back_menu_uninstall_another_app_done%==1 (
                                rem tiếp tục nhập tiếp
                                cls
                                goto menu_back_menu_uninstall_another_app
                            ) else if %menu_back_menu_uninstall_another_app_done%==0 (
                                rem quay lại menu chính
                                cls
                                goto menu_install_app
                            ) else if %menu_back_menu_uninstall_another_app_done%==00 (
                                rem thoát
                                exit
                            ) else (
                                cls
                                echo.
                                echo.
                                echo                LUA CHON BAN NHAP VAO KHONG HOP LE
                                echo                        VUI LONG NHAP LAI !
                                goto menu_back_menu_uninstall_another_app_done
                            )

                    rem ======================================================================================================================
            rem ============== 1.6 menu_hidden_show_app (*) ==================================================================================
                :menu_hidden_show_app
                echo.
                echo.
                echo.
                echo ============================================================
                echo.
                echo.
                echo  1:  AN UNG DUNG DA DUOC SETUP (*)
                echo  2:  HIEN THI LAI UNG DUNG DA DUOC SETUP (*)
                echo  3:  AN UNG DUNG KHAC (nhung ung dung khong duoc SETUP)
                echo  4:  HIEN THI UNG DUNG KHAC (nhung ung dung khong duoc SETUP)
                echo  5:  HIEN DANH SACH NHUNG UNG DUNG DA "disable-user"
                echo.
                echo  0:  QUAY LAI
                echo 00:  THOAT
                echo.
                echo.
                set /p menu_hidden_show_app=" VUI LONG NHAP LUA CHON CUA BAN :   "
                    if %menu_hidden_show_app%==1 (
                        rem ẩn ứng dụng đã setup trước
                        cls
                        goto menu_an_ung_dung_da_setup
                    ) else if %menu_hidden_show_app%==2 (
                        rem hiện những ứng dụng đã được setup
                        cls
                        goto menu_hien_ung_dung_da_setup
                    ) else if %menu_hidden_show_app%==3 (
                        rem ẩn những ứng dụng không được thiết lập sẵn
                        cls
                        goto menu_an_ung_dung_khong_duoc_setup
                    ) else if %menu_hidden_show_app%==4 (
                        rem hiện những ứng dụng không được thiết lập sẵn
                        cls
                        goto menu_hien_ung_dung_khong_duoc_setup
                    ) else if %menu_hidden_show_app%==5 (
                        rem hiện danh sách những ứng dụng đã dùng lệnh adb shell pm disable-user
                        cls
                        goto menu_danh_sach_ung_dung_da_disable
                    ) else if %menu_hidden_show_app%==0 (
                        rem quay lại menu chính
                        cls
                        goto menu_K1S
                    ) else if %menu_hidden_show_app%==00 (
                        rem thoát
                        exit
                    ) else (
                        cls
                        echo.
                        echo.
                        echo                LUA CHON BAN NHAP VAO KHONG HOP LE
                        echo                        VUI LONG NHAP LAI !
                        goto menu_hidden_show_app
                    )

            rem ==============================================================================================================================
                rem ============== 1.6.1 menu_an_ung_dung_da_setup ===========================================================================
                    :menu_an_ung_dung_da_setup
                    echo.
                    echo.
                    echo ==================== Xac nhan thuc hien ====================
                    echo.
                    echo Nhung ung dung se duoc an
                    echo    * Trinh Duyet Web
                    echo    * Ban Phim Tieng Trung
                    echo    * Danh Ba
                    echo    * Email
                    echo    * Cuoc Goi
                    echo    * Tin Nhan
                    echo    * Am Nhac
                    echo    * mdm
                    echo    * Bo cong cu SIM
                    echo.
                    echo.
                    echo  1:  XAC NHAN TIEP TUC THAO TAC
                    echo.
                    echo  0:  QUAY LAI
                    echo 00:  THOAT
                    echo.
                    echo.
                    set /p menu_an_ung_dung_da_setup=" VUI LONG NHAP LUA CHON CUA BAN :   "
                        if %menu_an_ung_dung_da_setup%==1 (
                            rem ẩn ứng dụng khi đã được xác nhận
                            cls
                             adb shell pm disable-user com.android.browser
                             adb shell pm disable-user com.android.contacts
                             adb shell pm disable-user com.android.mms
                             adb shell pm disable-user com.idatachina.mdm
                             adb shell pm disable-user com.android.dialer
                             adb shell pm disable-user com.iflytek.inputmethod.google
                             adb shell pm disable-user com.android.email
                             adb shell pm disable-user com.android.music
                             adb shell pm disable-user com.android.stk
                            goto menu_back_menu_an_ung_dung_da_setup
                        ) else if %menu_an_ung_dung_da_setup%==0 (
                            rem quay lại menu trước
                            cls
                            goto menu_hidden_show_app
                        ) else if %menu_an_ung_dung_da_setup%==00 (
                            rem thoát tools
                            exit
                        ) else (
                            cls
                            echo.
                            echo.
                            echo                LUA CHON BAN NHAP VAO KHONG HOP LE
                            echo                        VUI LONG NHAP LAI !
                            goto menu_an_ung_dung_da_setup
                        )

                rem ==========================================================================================================================
                    rem ============== 1.6.1.1 menu_back_menu_an_ung_dung_da_setup ===========================================================
                        :menu_back_menu_an_ung_dung_da_setup
                        cls
                        echo.
                        echo.
                        echo ======================= HOAN THANH ! =======================
                        echo.
                        echo.
                        echo  1:  TIEP TUC
                        echo.
                        echo  0:  QUAY LAI
                        echo 00:  THOAT
                        echo.
                        echo.
                        set /p menu_back_menu_an_ung_dung_da_setup=" VUI LONG NHAP LUA CHON CUA BAN :   "
                            if %menu_back_menu_an_ung_dung_da_setup%==1 (
                                cls
                                rem tiếp tục chạy tiếp
                                adb shell pm disable-user com.android.browser
                                adb shell pm disable-user com.android.contacts
                                adb shell pm disable-user com.android.mms
                                adb shell pm disable-user com.idatachina.mdm
                                adb shell pm disable-user com.android.dialer
                                adb shell pm disable-user com.iflytek.inputmethod.google
                                adb shell pm disable-user com.android.email
                                adb shell pm disable-user com.android.music
                                adb shell pm disable-user com.android.stk
                                goto menu_back_menu_an_ung_dung_da_setup
                            ) else if %menu_back_menu_an_ung_dung_da_setup%==0 (
                                rem quay lại menu
                                cls
                                goto menu_hidden_show_app
                            ) else if %menu_back_menu_an_ung_dung_da_setup%==00 (
                                rem thoát
                                exit
                            ) else (
                                cls
                                echo.
                                echo.
                                echo                LUA CHON BAN NHAP VAO KHONG HOP LE
                                echo                        VUI LONG NHAP LAI !
                                goto menu_back_menu_an_ung_dung_da_setup
                            )

                    rem ======================================================================================================================
                rem ==========================================================================================================================
                rem ============== 1.6.2 menu_hien_ung_dung_da_setup =========================================================================
                    :menu_hien_ung_dung_da_setup
                    echo.
                    echo.
                    echo ==================== Xac nhan thuc hien ====================
                    echo.
                    echo Nhung ung dung se duoc hien thi
                    echo    * Trinh Duyet Web
                    echo    * Ban Phim Tieng Trung
                    echo    * Danh Ba
                    echo    * Email
                    echo    * Cuoc Goi
                    echo    * Tin Nhan
                    echo    * Am Nhac
                    echo    * mdm
                    echo    * Bo cong cu SIM
                    echo.
                    echo.
                    echo  1:  XAC NHAN TIEP TUC THAO TAC
                    echo.
                    echo  0:  QUAY LAI
                    echo 00:  THOAT
                    echo.
                    echo.
                    set /p menu_hien_ung_dung_da_setup=" VUI LONG NHAP LUA CHON CUA BAN :   "
                        if %menu_hien_ung_dung_da_setup%==1 (
                            rem hiện ứng dụng khi đã được xác nhận
                            cls
                             adb shell pm enable com.android.browser
                             adb shell pm enable com.android.contacts
                             adb shell pm enable com.android.mms
                             adb shell pm enable com.idatachina.mdm
                             adb shell pm enable com.android.dialer
                             adb shell pm enable com.iflytek.inputmethod.google
                             adb shell pm enable com.android.email
                             adb shell pm enable com.android.music
                             adb shell pm enable com.mediatek.filemanager
                             adb shell pm enable com.android.packageinstaller
                            goto menu_back_menu_hien_ung_dung_da_setup
                        ) else if %menu_hien_ung_dung_da_setup%==0 (
                            rem quay lại menu trước
                            cls
                            goto menu_hidden_show_app
                        ) else if %menu_hien_ung_dung_da_setup%==00 (
                            rem thoát tools
                            exit
                        ) else (
                            cls
                            echo.
                            echo.
                            echo                LUA CHON BAN NHAP VAO KHONG HOP LE
                            echo                        VUI LONG NHAP LAI !
                            goto menu_hien_ung_dung_da_setup
                        )

                rem ==========================================================================================================================
                    rem ============== 1.6.2.1 menu_back_menu_hien_ung_dung_da_setup =========================================================
                        :menu_back_menu_hien_ung_dung_da_setup
                        cls
                        echo.
                        echo.
                        echo ======================= HOAN THANH ! =======================
                        echo.
                        echo.
                        echo  1:  TIEP TUC
                        echo.
                        echo  0:  QUAY LAI
                        echo 00:  THOAT
                        echo.
                        echo.
                        set /p menu_back_menu_hien_ung_dung_da_setup=" VUI LONG NHAP LUA CHON CUA BAN :   "
                            if %menu_back_menu_hien_ung_dung_da_setup%==1 (
                                cls
                                rem tiếp tục chạy tiếp
                                    adb shell pm enable com.android.browser
                                    adb shell pm enable com.android.contacts
                                    adb shell pm enable com.android.mms
                                    adb shell pm enable com.idatachina.mdm
                                    adb shell pm enable com.android.dialer
                                    adb shell pm enable com.iflytek.inputmethod.google
                                    adb shell pm enable com.android.email
                                    adb shell pm enable com.android.music
                                    adb shell pm enable com.mediatek.filemanager
                                    adb shell pm enable com.android.packageinstaller
                                goto menu_back_menu_hien_ung_dung_da_setup
                            ) else if %menu_back_menu_hien_ung_dung_da_setup%==0 (
                                rem quay lại menu
                                cls
                                goto menu_hidden_show_app
                            ) else if %menu_back_menu_hien_ung_dung_da_setup%==00 (
                                rem thoát
                                exit
                            ) else (
                                cls
                                echo.
                                echo.
                                echo                LUA CHON BAN NHAP VAO KHONG HOP LE
                                echo                        VUI LONG NHAP LAI !
                                goto menu_back_menu_hien_ung_dung_da_setup
                            )

                    rem ======================================================================================================================
                rem ============== 1.6.3 menu_an_ung_dung_khong_duoc_setup ===================================================================
                    :menu_an_ung_dung_khong_duoc_setup
                    cls
                                adb shell pm list packages                                    
                    echo ************************************************************
                    echo.
                    echo.
                    echo VUI LONG NHAP PACKAGES NAME CUA UNG DUNG BAN MUON AN
                    echo      * NHAP 'back' DE QUAY LAI
                    echo      * NHAP 'exit' DE THOAT
                    echo.
                    set /p an_ung_dung_khong_duoc_setup="packages name hidden: "
                        if "%an_ung_dung_khong_duoc_setup%"=="back" (
                            cls
                            goto menu_hidden_show_app
                        ) else if "%an_ung_dung_khong_duoc_setup%"=="exit" (
                            cls
                            exit
                        ) else (
                                adb shell pm list packages
                            echo ************************************************************
                                adb shell pm disable-user "%an_ung_dung_khong_duoc_setup%"
                            if ERRORLEVEL 1 (
                                cls
                                echo LOI: Khong the an ung dung. Vui long kiem tra packages name hoac thu lai.
                                goto menu_an_ung_dung_khong_duoc_setup
                            ) else (
                                cls
                                echo.
                                echo.
                                echo         ********** Ung dung da duoc an thanh cong **********
                            )
                            goto menu_an_ung_dung_khong_duoc_setup_done
                        )

                rem ==========================================================================================================================
                    rem ============== 1.6.3.1 menu_an_ung_dung_khong_duoc_setup_done ========================================================
                        :menu_an_ung_dung_khong_duoc_setup_done
                        echo.
                        echo ============================================================
                        echo.
                        echo.
                        echo  1:  TIEP TUC
                        echo.
                        echo  0:  QUAY LAI
                        echo 00:  THOAT
                        set /p menu_an_ung_dung_khong_duoc_setup_done=" VUI LONG NHAP LUA CHON CUA BAN :   "
                            if %menu_an_ung_dung_khong_duoc_setup_done%==1 (
                                rem tiếp tục nhập tiếp
                                cls
                                goto menu_back_menu_menu_an_ung_dung_khong_duoc_setup
                            ) else if %menu_an_ung_dung_khong_duoc_setup_done%==0 (
                                rem quay lại menu chính
                                cls
                                goto menu_hidden_show_app
                            ) else if %menu_an_ung_dung_khong_duoc_setup_done%==00 (
                                rem thoát
                                exit
                            ) else (
                                cls
                                echo.
                                echo.
                                echo                LUA CHON BAN NHAP VAO KHONG HOP LE
                                echo                        VUI LONG NHAP LAI !
                                goto menu_an_ung_dung_khong_duoc_setup_done
                            )

                    rem ======================================================================================================================
                rem ============== 1.6.4 menu_hien_ung_dung_khong_duoc_setup =================================================================
                    :menu_hien_ung_dung_khong_duoc_setup
                    cls
                                    adb shell pm list packages -d
                    echo ************************************************************
                    echo.
                    echo.
                    echo VUI LONG NHAP PACKAGES NAME CUA UNG DUNG BAN MUON HIEN
                    echo      * NHAP 'back' DE QUAY LAI
                    echo      * NHAP 'exit' DE THOAT
                    echo.
                    set /p hien_ung_dung_khong_duoc_setup="packages name show: "
                        if "%hien_ung_dung_khong_duoc_setup%"=="back" (
                            cls
                            goto menu_hidden_show_app
                        ) else if "%hien_ung_dung_khong_duoc_setup%"=="exit" (
                            cls
                            exit
                        ) else (
                             adb shell pm list packages -d
                            echo ************************************************************
                             adb shell pm enable "%hien_ung_dung_khong_duoc_setup%"
                            if ERRORLEVEL 1 (
                                cls
                                echo LOI: Khong the hien ung dung. Vui long kiem tra packages name hoac thu lai.
                                goto menu_hien_ung_dung_khong_duoc_setup
                            ) else (
                                cls
                                echo.
                                echo.
                                echo         ********** Ung dung da duoc hien thanh cong **********
                            )
                            goto menu_hien_ung_dung_khong_duoc_setup_done
                        )

                rem ==========================================================================================================================
                    rem ============== 1.6.4.1 menu_hien_ung_dung_khong_duoc_setup_done ======================================================
                        :menu_hien_ung_dung_khong_duoc_setup_done
                        echo.
                        echo ============================================================
                        echo.
                        echo.
                        echo  1:  TIEP TUC
                        echo.
                        echo  0:  QUAY LAI
                        echo 00:  THOAT
                        set /p menu_hien_ung_dung_khong_duoc_setup_done=" VUI LONG NHAP LUA CHON CUA BAN :   "
                            if %menu_hien_ung_dung_khong_duoc_setup_done%==1 (
                                rem tiếp tục nhập tiếp
                                cls
                                goto menu_back_menu_menu_hien_ung_dung_khong_duoc_setup
                            ) else if %menu_hien_ung_dung_khong_duoc_setup_done%==0 (
                                rem quay lại menu chính
                                cls
                                goto menu_hidden_show_app
                            ) else if %menu_hien_ung_dung_khong_duoc_setup_done%==00 (
                                rem thoát
                                exit
                            ) else (
                                cls
                                echo.
                                echo.
                                echo                LUA CHON BAN NHAP VAO KHONG HOP LE
                                echo                        VUI LONG NHAP LAI !
                                goto menu_hien_ung_dung_khong_duoc_setup_done
                            )

                    rem ======================================================================================================================
                rem ============== 1.6.5 menu_danh_sach_ung_dung_da_disable ==================================================================
                    :menu_danh_sach_ung_dung_da_disable
                        adb shell pm list packages -d
                    echo.
                    echo ============================================================
                    echo.
                    echo  0:  QUAY LAI
                    echo 00:  THOAT
                    echo.
                    echo.
                    set /p menu_danh_sach_ung_dung_da_disable=" VUI LONG NHAP LUA CHON CUA BAN :   "
                        if %menu_danh_sach_ung_dung_da_disable%==0 (
                            rem quay lại menu chính
                            cls
                            goto menu_hidden_show_app
                        ) else if %menu_danh_sach_ung_dung_da_disable%==00 (
                            rem thoát
                            exit
                        ) else (
                            cls
                            echo.
                            echo.
                            echo                LUA CHON BAN NHAP VAO KHONG HOP LE
                            echo                        VUI LONG NHAP LAI !
                            goto menu_danh_sach_ung_dung_da_disable
                        )

                rem ==========================================================================================================================
            rem ==============================================================================================================================
            rem ============== 1.7 menu_delete_app (*) =======================================================================================
                :menu_delete_app
                echo.
                echo.
                echo.
                echo ============================================================
                echo.
                echo.
                echo  1:  XOA UNG DUNG DA DUOC SETUP (*)
                echo  2:  XOA UNG DUNG KHAC 
                echo.
                echo  0:  QUAY LAI
                echo 00:  THOAT
                echo.
                echo.
                set /p menu_delete_app=" VUI LONG NHAP LUA CHON CUA BAN :   "
                     if %menu_delete_app%==1 (
                        cls
                        goto xoa_ung_dung_da_setup
                     ) else if %menu_delete_app%==2 (
                        cls
                        goto xoa_ung_dung_khac
                     ) else if %menu_delete_app%==0 (
                        rem quay lại menu chính
                        cls
                        goto menu_K1S
                    ) else if %menu_delete_app%==00 (
                        rem thoát
                        exit
                    ) else (
                        cls
                        echo.
                        echo.
                        echo                LUA CHON BAN NHAP VAO KHONG HOP LE
                        echo                        VUI LONG NHAP LAI !
                        goto menu_delete_app
                    )

            rem ==============================================================================================================================
                rem ============== 1.7.1 xoa_ung_dung_da_setup ===============================================================================
                    :xoa_ung_dung_da_setup
                    echo.
                    echo.
                    echo.
                    echo ==================== Xac nhan thuc hien ====================
                    echo.
                    echo.
                    echo Nhung ung dung se duoc XOA
                    echo    * Trinh Duyet Web
                    echo.
                    echo.
                    echo  1:  XAC NHAN TIEP TUC THAO TAC
                    echo.
                    echo  0:  QUAY LAI
                    echo 00:  THOAT
                    echo.
                    echo.
                    set /p xoa_ung_dung_da_setup=" VUI LONG NHAP LUA CHON CUA BAN :   "
                        if %xoa_ung_dung_da_setup%==1 (
                            rem xóa ứng dụng đã được setup sẵn khỏi thiếp bị
                            cls
                            adb shell pm uninstall -k --user 0 com.android.browser
                            rem bổ sung các ứng dụng bạn muốn xóa khác vào đây
                            cls
                            goto xoa_ung_dung_da_setup_done
                        ) else if %xoa_ung_dung_da_setup%==0 (
                            cls
                            goto menu_delete_app
                        ) else if %xoa_ung_dung_da_setup%==00 (
                            rem thoát
                            exit
                        ) else (
                            cls
                            echo.
                            echo.
                            echo                LUA CHON BAN NHAP VAO KHONG HOP LE
                            echo                        VUI LONG NHAP LAI !
                            goto xoa_ung_dung_da_setup
                        )

                rem ==========================================================================================================================
                rem ============== 1.7.2 xoa_ung_dung_khac ===================================================================================
                    :xoa_ung_dung_khac
                    cls
                            adb shell pm list packages
                    echo ************************************************************
                    echo.
                    echo.
                    echo VUI LONG NHAP PACKAGES NAME CUA UNG DUNG BAN MUON GO CAI DAT
                    echo      * NHAP 'back' DE QUAY LAI
                    echo      * NHAP 'exit' DE THOAT
                    echo.
                    set /p uninstall_another_app="packages name uninstall: "
                        if "%uninstall_another_app%"=="back" (
                            cls
                            goto menu_delete_app
                        ) else if "%uninstall_another_app%"=="exit" (
                            cls
                            exit
                        ) else (
                             adb shell pm list packages -3
                            echo ************************************************************
                             adb shell pm uninstall -k --user 0 "%uninstall_another_app%"
                            if ERRORLEVEL 1 (
                                cls
                                echo LOI: Khong the go cai dat ung dung. Vui long kiem tra packages name hoac thu lai.
                                goto menu_back_menu_uninstall_another_app
                            ) else (
                                echo.
                                echo.
                                echo         ********** Ung dung da duoc go cai dat thanh cong **********
                            )
                                goto menu_back_menu_uninstall_another_app_done
                        )

                rem ==========================================================================================================================
                    rem ============== 1.7.1.1 xoa_ung_dung_da_setup_done ====================================================================
                        :xoa_ung_dung_da_setup_done
                        echo.
                        echo.
                        echo.
                        echo ======================= HOAN THANH ! =======================
                        echo.
                        echo.
                        echo.
                        echo  0:  QUAY LAI
                        echo 00:  THOAT
                        echo.
                        echo.
                        set /p xoa_ung_dung_da_setup_done=" VUI LONG NHAP LUA CHON CUA BAN :   "
                            if %xoa_ung_dung_da_setup_done%==0 (
                                rem quay lại menu chính
                                cls
                                goto xoa_ung_dung_da_setup
                            ) else if %xoa_ung_dung_da_setup_done%==00 (
                                rem thoát
                                exit
                            ) else (
                                cls
                                echo.
                                echo.
                                echo                LUA CHON BAN NHAP VAO KHONG HOP LE
                                echo                        VUI LONG NHAP LAI !
                                goto xoa_ung_dung_da_setup_done
                            )

                    rem ======================================================================================================================
                    rem ============== 1.7.2.1 xoa_ung_dung_khac_done ========================================================================
                        :xoa_ung_dung_khac_done
                        cls
                        echo.
                        echo ============================================================
                        echo.
                        echo.
                        echo  1:  TIEP TUC
                        echo.
                        echo  0:  QUAY LAI
                        echo 00:  THOAT
                        set /p xoa_ung_dung_khac_done=" VUI LONG NHAP LUA CHON CUA BAN :   "
                            if %xoa_ung_dung_khac_done%==1 (
                                rem tiếp tục nhập tiếp
                                cls
                                goto xoa_ung_dung_khac
                            ) else if %xoa_ung_dung_khac_done%==0 (
                                rem quay lại menu chính
                                cls
                                goto menu_delete_app
                            ) else if %xoa_ung_dung_khac_done%==00 (
                                rem thoát
                                exit
                            ) else (
                                cls
                                echo.
                                echo.
                                echo                LUA CHON BAN NHAP VAO KHONG HOP LE
                                echo                        VUI LONG NHAP LAI !
                                goto xoa_ung_dung_khac_done
                            )

                    rem ======================================================================================================================
            rem ============== 1.8 menu_ten_goi ==============================================================================================
                :menu_ten_goi
                cls
                echo.
                echo.
                echo.
                echo ============================================================
                echo.
                echo.
                echo  1:  HIEN TAT CA PACKAGES NAME
                echo  2:  HIEN PACKAGES NAME HE THONG
                echo  3:  HIEN PACKAGES NAME NGUOI CUNG CAI DAT
                echo  4:  HIEN PACKAGES NAME UNG DUNG DANG MO
                echo  5:  HIEN PACKAGES NAME UNG DUNG DA DISABLE
                echo.
                echo  0:  QUAY LAI
                echo 00:  THOAT
                set /p menu_ten_goi=" VUI LONG NHAP LUA CHON CUA BAN :   "
                    if %menu_ten_goi%==1 (
                        cls
                        goto hien_tat_ca_packages_name
                    ) else if %menu_ten_goi%==2 (
                        cls
                        goto hien_packages_name_system
                    ) else if %menu_ten_goi%==3 (
                        cls
                        goto hien_packages_name_user_install
                    ) else if %menu_ten_goi%==4 (
                        cls
                        goto hien_packages_name_ung_dung_dang_mo
                    ) else if %menu_ten_goi%==5 (
                        cls
                        goto hien_packages_name_ung_dung_da_disable
                    ) else if %menu_ten_goi%==0 (
                        rem quay lại menu chính
                        cls
                        goto menu_K1S
                    ) else if %menu_ten_goi%==00 (
                        rem thoát
                        exit
                    ) else (
                        cls
                        echo.
                        echo.
                        echo                LUA CHON BAN NHAP VAO KHONG HOP LE
                        echo                        VUI LONG NHAP LAI !
                        goto menu_ten_goi
                    )

            rem ==============================================================================================================================
                rem ============== 1.8.1 hien_tat_ca_packages_name ===========================================================================
                    :hien_tat_ca_packages_name
                    cls
                    echo.
                        adb shell pm list packages
                    echo.
                    echo ************************************************************
                    echo.
                    echo.
                    echo  1:  TIEP TUC
                    echo.
                    echo  0:  QUAY LAI
                    echo 00:  THOAT
                    set /p hien_tat_ca_packages_name=" VUI LONG NHAP LUA CHON CUA BAN :   "
                        if %hien_tat_ca_packages_name%==1 (
                            cls
                            goto hien_tat_ca_packages_name
                        ) else if %hien_tat_ca_packages_name%==0 (
                            cls
                            goto menu_ten_goi
                        ) else if  %hien_tat_ca_packages_name%==00 (
                            rem thoát
                            exit
                        ) else (
                            cls
                            echo.
                            echo.
                            echo                LUA CHON BAN NHAP VAO KHONG HOP LE
                            echo                        VUI LONG NHAP LAI !
                            goto hien_tat_ca_packages_name
                        )

                rem ==========================================================================================================================
                rem ============== 1.8.2 hien_packages_name_system ===========================================================================
                    :hien_packages_name_system
                    cls
                    echo.
                        adb shell pm list packages -s
                    echo.
                    echo ************************************************************
                    echo.
                    echo.
                    echo  1:  TIEP TUC
                    echo.
                    echo  0:  QUAY LAI
                    echo 00:  THOAT
                    set /p hien_packages_name_system=" VUI LONG NHAP LUA CHON CUA BAN :   "
                        if %hien_packages_name_system%==1 (
                            cls
                            goto hien_packages_name_system
                        ) else if %hien_packages_name_system%==0 (
                            cls
                            goto menu_ten_goi
                        ) else if  %hien_packages_name_system%==00 (
                            rem thoát
                            exit
                        ) else (
                            cls
                            echo.
                            echo.
                            echo                LUA CHON BAN NHAP VAO KHONG HOP LE
                            echo                        VUI LONG NHAP LAI !
                            goto hien_packages_name_system
                        )
                        
                rem ==========================================================================================================================
                rem ============== 1.8.3 hien_packages_name_user_install =====================================================================
                    :hien_packages_name_user_install
                    cls
                    echo.
                        adb shell pm list packages -3
                    echo.
                    echo ************************************************************
                    echo.
                    echo.
                    echo  1:  TIEP TUC
                    echo.
                    echo  0:  QUAY LAI
                    echo 00:  THOAT
                    set /p hien_packages_name_user_install=" VUI LONG NHAP LUA CHON CUA BAN :   "
                        if %hien_packages_name_user_install%==1 (
                            cls
                            goto hien_packages_name_user_install
                        ) else if %hien_packages_name_user_install%==0 (
                            cls
                            goto menu_ten_goi
                        ) else if  %hien_packages_name_user_install%==00 (
                            rem thoát
                            exit
                        ) else (
                            cls
                            echo.
                            echo.
                            echo                LUA CHON BAN NHAP VAO KHONG HOP LE
                            echo                        VUI LONG NHAP LAI !
                            goto hien_packages_name_user_install
                        )
                        
                rem ==========================================================================================================================
                rem ============== 1.8.4 hien_packages_name_ung_dung_dang_mo =================================================================
                    :hien_packages_name_ung_dung_dang_mo
                    cls
                    echo.
                        adb shell dumpsys window | findstr mCurrentFocus
                    echo.
                    echo ************************************************************
                    echo.
                    echo.
                    echo  1:  TIEP TUC
                    echo.
                    echo  0:  QUAY LAI
                    echo 00:  THOAT
                    set /p hien_packages_name_ung_dung_dang_mo=" VUI LONG NHAP LUA CHON CUA BAN :   "
                        if %hien_packages_name_ung_dung_dang_mo%==1 (
                            cls
                            goto hien_packages_name_ung_dung_dang_mo
                        ) else if %hien_packages_name_ung_dung_dang_mo%==0 (
                            cls
                            goto menu_ten_goi
                        ) else if  %hien_packages_name_ung_dung_dang_mo%==00 (
                            rem thoát
                            exit
                        ) else (
                            cls
                            echo.
                            echo.
                            echo                LUA CHON BAN NHAP VAO KHONG HOP LE
                            echo                        VUI LONG NHAP LAI !
                            goto hien_packages_name_ung_dung_dang_mo
                        )
                        
                rem ==========================================================================================================================
                rem ============== 1.8.5 hien_packages_name_ung_dung_da_disable ==============================================================
                    :hien_packages_name_ung_dung_da_disable
                    cls
                    echo.
                        adb shell pm list packages -d
                    echo.
                    echo ************************************************************
                    echo.
                    echo.
                    echo  1:  TIEP TUC
                    echo.
                    echo  0:  QUAY LAI
                    echo 00:  THOAT
                    set /p hien_packages_name_ung_dung_da_disable=" VUI LONG NHAP LUA CHON CUA BAN :   "
                        if %hien_packages_name_ung_dung_da_disable%==1 (
                            cls
                            goto hien_packages_name_ung_dung_da_disable
                        ) else if %hien_packages_name_ung_dung_da_disable%==0 (
                            cls
                            goto menu_ten_goi
                        ) else if  %hien_packages_name_ung_dung_da_disable%==00 (
                            rem thoát
                            exit
                        ) else (
                            cls
                            echo.
                            echo.
                            echo                LUA CHON BAN NHAP VAO KHONG HOP LE
                            echo                        VUI LONG NHAP LAI !
                            goto hien_packages_name_ung_dung_da_disable
                        )
                        
                rem ==========================================================================================================================
            rem ============== 1.9 menu_pass_wifi ============================================================================================
                :menu_pass_wifi
                cls
                echo.
                echo.
                echo.
                echo ============================================================
                echo.
                echo.
                echo  1:  NHAP PASSWORD WIFI J^&T Expreess Office
                echo  2:  NHAP PASSWORD WIFI J^&T Expreess Guest
                echo  3:  NHAP DU LIEU VAO MAN HINH
                echo.
                echo  0:  QUAY LAI
                echo 00:  THOAT
                set /p menu_pass_wifi=" VUI LONG NHAP LUA CHON CUA BAN :   "
                    if %menu_pass_wifi%==1 (
                        cls
                        goto wifi_JT_Expreess_Office
                    ) else if %menu_pass_wifi%==2 (
                        cls
                        goto wifi_JT_Expreess_Guest
                    ) else if %menu_pass_wifi%==3 (
                        cls
                        goto nhap_du_lieu_vao_man_hinh
                    ) else if %menu_pass_wifi%==0 (
                        cls
                        goto menu_K1S
                    ) else if %menu_pass_wifi%==00 (
                        rem thoát
                        exit
                    ) else (
                        cls
                        echo.
                        echo.
                        echo                LUA CHON BAN NHAP VAO KHONG HOP LE
                        echo                        VUI LONG NHAP LAI !
                        goto menu_pass_wifi
                    )

            rem ==============================================================================================================================
                rem ============== 1.9.1 wifi_JT_Expreess_Office =============================================================================
                    :wifi_JT_Expreess_Office
                    cls
                        adb shell input text "%pass_wifi_jt_expreess_office%"
                    cls
                    echo %pass_wifi_jt_expreess_office%
                    echo ======================= HOAN THANH ! =======================
                    echo.
                    echo.
                    echo  1:  THUC HIEN LAI THAO TAC
                    echo.
                    echo  0:  QUAY LAI
                    echo 00:  THOAT
                    set /p wifi_JT_Expreess_Office=" VUI LONG NHAP LUA CHON CUA BAN :   "
                        if %wifi_JT_Expreess_Office%==1 (
                            cls
                            goto wifi_JT_Expreess_Office
                        ) else if %wifi_JT_Expreess_Office%==0 (
                            cls
                            goto menu_pass_wifi
                        ) else if %wifi_JT_Expreess_Office%==00 (
                            exit
                        ) else (
                            cls
                            echo.
                            echo.
                            echo                LUA CHON BAN NHAP VAO KHONG HOP LE
                            echo                        VUI LONG NHAP LAI !
                            goto wifi_JT_Expreess_Office
                        )

                rem ==========================================================================================================================
                rem ============== 1.9.2 wifi_JT_Expreess_Guest ==============================================================================
                    :wifi_JT_Expreess_Guest
                    cls
                        adb shell input text "%pass_wifi_JT_Expreess_Guest%"
                    cls
                    echo %pass_wifi_JT_Expreess_Guest%
                    echo ======================= HOAN THANH ! =======================
                    echo.
                    echo.
                    echo  1:  THUC HIEN LAI THAO TAC
                    echo.
                    echo  0:  QUAY LAI
                    echo 00:  THOAT
                    set /p wifi_JT_Expreess_Guest=" VUI LONG NHAP LUA CHON CUA BAN :   "
                        if %wifi_JT_Expreess_Guest%==1 (
                            cls
                            goto wifi_JT_Expreess_Guest
                        ) else if %wifi_JT_Expreess_Guest%==0 (
                            cls
                            goto menu_pass_wifi
                        ) else if %wifi_JT_Expreess_Guest%==00 (
                            exit
                        ) else (
                            cls
                            echo.
                            echo.
                            echo                LUA CHON BAN NHAP VAO KHONG HOP LE
                            echo                        VUI LONG NHAP LAI !
                            goto wifi_JT_Expreess_Office
                        )

                rem ==========================================================================================================================
                rem ============== 1.9.3 nhap_du_lieu_vao_man_hinh ===========================================================================
                    :nhap_du_lieu_vao_man_hinh
                    cls
                    echo Vui long nhap noi dung ban muon nhap vao thiep bi
                    echo      * NHAP 'back' DE QUAY LAI
                    echo      * NHAP 'exit' DE THOAT
                    echo.
                    echo.
                    set /p nhap_du_lieu_vao_man_hinh="Nhap noi dung vao day:   "
                        if "%nhap_du_lieu_vao_man_hinh%"=="back" (
                            cls
                            goto menu_pass_wifi
                        ) else if "%nhap_du_lieu_vao_man_hinh%"=="exit" (
                            exit
                        ) else (
                                adb shell input text "%nhap_du_lieu_vao_man_hinh%"
                            if ERRORLEVEL 1 (
                                cls
                                echo LOI: Khong the thuc hien thao tac. Vui long kiem tra lai
                                goto nhap_du_lieu_vao_man_hinh
                            ) else (
                                cls
                                goto nhap_du_lieu_vao_man_hinh
                            )
                        )

                rem ==========================================================================================================================
            rem ==============================================================================================================================
            rem ============== 1.10 menu_auto_run_k1s (*) ====================================================================================
                :menu_auto_run_k1s
                cls
                echo Thuc hien tu dong SETUP tu dong thiep bi IDATA K1S
                 adb devices -l
                echo.
                echo ==================== Xac nhan thuc hien ====================
                echo Ban vui long bat che do nha phat trien - BAT go loi USB
                echo.
                echo - Nhung ung dung se duoc an
                echo        * Trinh Duyet Web
                echo        * Ban Phim Tieng Trung
                echo        * Danh Ba
                echo        * Email
                echo        * Cuoc Goi
                echo        * Tin Nhan
                echo        * Am Nhac
                echo        * mdm
                echo        * Bo cong cu SIM
                echo - Ung dung JT ban cu se duoc XOA
                echo.
                echo ============================================================
                echo.
                echo  1:  XAC NHAN TIEP TUC THAO TAC
                echo.
                echo  0:  QUAY LAI
                echo 00:  THOAT
                set /p menu_auto_run_k1s=" VUI LONG NHAP LUA CHON CUA BAN :   "
                    if %menu_auto_run_k1s%==1 (
                        cls
                        goto start_run
                    ) else if %menu_auto_run_k1s%==0 (
                        cls
                        goto menu_K1S
                    ) else if %menu_auto_run_k1s%==00 (
                        exit
                    ) else (
                        cls
                        echo.
                        echo.
                        echo                LUA CHON BAN NHAP VAO KHONG HOP LE
                        echo                        VUI LONG NHAP LAI !
                        goto menu_auto_run_k1s
                    )

            rem ==============================================================================================================================
                        rem ============== start_run =========================================================================================
                            :start_run
                            echo Bat dau thuc thi
                             adb devices -l
                             adb get-serialno
                            rem bật wifi
                             adb shell svc wifi enable
                            rem bật giây trên thanh thông báo
                             adb shell settings put secure clock_seconds 1
                            rem cài múi giờ
                             adb shell service call alarm 3 s16 Asia/Ho_Chi_Minh
                            rem cài ngôn ngữ
                             adb shell content query --uri content://settings/system --where "name=\'system_locales\'"
                             adb shell content delete --uri content://settings/system --where "name=\'system_locales\'"
                             adb shell content insert --uri content://settings/system --bind name:s:system_locales --bind value:s:vi-VN
                            rem xóa app JT cũ
                             adb uninstall "%packages_name_JT_cu%"
                            rem cài app JT bản mới nhất
                             adb install -r "%duong_dan_app_ban_moi%"
                             rem adb install -r "%duong_dan_app_ban_cu%" dùng khi bản mới lỗi
                            rem tạo thư mục apk_file trong máy
                             adb shell mkdir /storage/emulated/0/apk_file
                            rem copy file từ máy tính sang thiếp bị
                             adb push "%duong_dan_app_ban_moi%" /storage/emulated/0/apk_file
                            rem ẩn ứng dụng
                             adb shell pm disable-user com.android.browser
                             adb shell pm disable-user com.android.contacts
                             adb shell pm disable-user com.android.mms
                             adb shell pm disable-user com.idatachina.mdm
                             adb shell pm disable-user com.android.dialer
                             adb shell pm disable-user com.iflytek.inputmethod.google
                             adb shell pm disable-user com.android.email
                             adb shell pm disable-user com.android.music
                             adb shell pm disable-user com.android.stk
                            rem mở ứng dụng scanpro lên setup
                            cls
                             adb shell am start -n com.idata.iscanv2/com.idata.iscanv2.MainActivity
                            echo sau khi reset vao app "iSanPro" ===== app setting
                            echo ============================================================
                            echo additional content              ===== "null"
                            echo scan result output mode         ===== "output to broadcast"
                            echo ============================================================
                            echo sau khi SETUP vui long an phim bat ki de ket thuc
                            pause
                             adb shell am force-stop com.idata.iscanv2
                            cls
                            timeout /t 05
                             adb reboot
                            goto menu_auto_run_k1s

                        rem ==================================================================================================================
            rem ==============================================================================================================================
            rem ============== 1.11 menu_restart =============================================================================================
                :menu_restart
                echo.
                echo.
                echo.
                echo ============================================================
                echo.
                echo  1:  TIEP TUC
                echo.
                echo  0:  QUAY LAI
                echo 00:  THOAT
                set /p menu_restart=" VUI LONG NHAP LUA CHON CUA BAN :   "
                    if %menu_restart%==1 (
                        cls
                         adb reboot
                        cls
                        goto menu_restart
                    ) else if %menu_restart%==0 (
                        cls
                        goto menu_K1S
                    ) else if %menu_restart%==00 (
                        exit
                    ) else (
                        cls
                        echo.
                        echo.
                        echo                LUA CHON BAN NHAP VAO KHONG HOP LE
                        echo                        VUI LONG NHAP LAI !
                        goto menu_restart
                    )

            rem ==============================================================================================================================
        rem ==================================================================================================================================
        rem ============== 2. menu_autoid_Q9 =================================================================================================
            cls
            :menu_autoid_Q9
            echo.
            echo.
            echo.
            echo ========================= IDATA AUTOID Q9 =======================
            echo.
            echo.           
            echo  1:  liet ke thiep bi dang ket noi
            echo  2:  Bat / Tat WIFI 
            echo  3:  Cai dat giay tren thanh trang thai
            echo  4:  Cai dat ung dung
            echo  5:  An / Hien ung dung khong can Thiet
            echo  6:  Xoa ung dung ( ke ca mac dinh ) khoi thiep bi
            echo  7:  Hien ten goi cua ung 
            echo  8:  Nhap Password WIFI
            echo  9:  Restart lai thiep bi 
            echo 10:  AUTO SETUP IDATA (*)
            echo.
            echo  0:  QUAY LAI
            echo 00:  THOAT
            echo.
            echo.
            set /p menu_autoid_Q9=" VUI LONG NHAP LUA CHON CUA BAN :   "
                if %menu_autoid_Q9%==1 (
                    rem liet ke thiep bi dang ket noi
                    cls
                    goto menu_adb_devices_autoid_Q9
                ) else if %menu_autoid_Q9%==2 (
                    rem Bat / Tat WIFI
                    cls
                    goto menu_wifi_autoid_Q9
                ) else if %menu_autoid_Q9%==3 (
                    rem cài giây trên thanh thông báo
                    cls
                    goto menu_cai_giay_autoid_Q9
                ) else if %menu_autoid_Q9%==4 (
                    rem cài đặt ứng dụng
                    cls
                    goto menu_install_app_autoid_Q9
                ) else if %menu_autoid_Q9%==5 (
                    rem ẩn / hiện ứng dụng
                    cls
                    goto menu_hidden_show_app_autoid_Q9
                ) else if %menu_autoid_Q9%==6 (
                    rem xóa ứng dụng mặc định
                    cls
                    goto menu_delete_app_autoid_Q9
                ) else if %menu_autoid_Q9%==7 (
                    rem hiện tên gói ứng dụng
                    cls
                    goto menu_ten_goi_autoid_Q9
                ) else if %menu_autoid_Q9%==8 (
                    rem nhập pass wifi vào ô
                    cls
                    goto menu_pass_wifi_autoid_Q9
                ) else if %menu_autoid_Q9%==9 (
                    rem Restart thiếp bị
                    cls
                    goto menu_restart_autoid_Q9
                ) else if %menu_autoid_Q9%==10 (
                    rem chạy auto toàn bộ
                    cls
                    goto menu_auto_run_autoid_Q9
                ) else if %menu_autoid_Q9%==0 (
                    rem quay lại menu chính
                    cls
                    goto mainmenu
                ) else if %menu_autoid_Q9%==00 (
                    rem thoát
                    exit
                ) else (
                    cls
                    echo.
                    echo.
                    echo                LUA CHON BAN NHAP VAO KHONG HOP LE
                    echo                        VUI LONG NHAP LAI !
                    goto menu_autoid_Q9
                )

        rem ==================================================================================================================================
            rem ============== 2.1 menu_adb_devices_autoid_Q9 ================================================================================
                :menu_adb_devices_autoid_Q9
                 adb devices -l
                 adb get-serialno
                echo.
                echo.
                echo.
                echo ============================================================
                echo.
                echo.
                echo.
                echo  0:  QUAY LAI
                echo 00:  THOAT
                echo.
                echo.
                set /p menu_adb_devices_autoid_Q9=" VUI LONG NHAP LUA CHON CUA BAN :   "
                    if %menu_adb_devices_autoid_Q9%==0 (
                        rem quay lại menu chính
                        cls
                        goto menu_autoid_Q9
                    ) else if %menu_adb_devices_autoid_Q9%==00 (
                        rem thoát
                        exit
                    ) else (
                        cls
                        echo.
                        echo.
                        echo                LUA CHON BAN NHAP VAO KHONG HOP LE
                        echo                        VUI LONG NHAP LAI !
                        goto menu_adb_devices_autoid_Q9
                    )

            rem ==============================================================================================================================
            rem ============== 2.2 menu_wifi_autoid_Q9 =======================================================================================
                :menu_wifi_autoid_Q9
                echo.
                echo.
                echo.
                echo ============================================================
                echo.
                echo.
                echo  1:  BAT WIFI
                echo  2:  TAT WIFI
                echo.
                echo  0:  QUAY LAI
                echo 00:  THOAT
                echo.
                echo.
                set /p menu_wifi_autoid_Q9=" VUI LONG NHAP LUA CHON CUA BAN :   "                   
                    if %menu_wifi_autoid_Q9%==1 (
                        rem bật wifi
                        cls
                         adb shell svc wifi enable
                        goto menu_back_menu_wifi_autoid_Q9
                    ) else if %menu_wifi_autoid_Q9%==2 (
                        rem tắt wifi
                        cls
                         adb shell svc wifi disable
                        goto menu_back_menu_wifi_autoid_Q9
                    ) else if %menu_wifi_autoid_Q9%==0 (
                        rem quay lại menu chính
                        cls
                        goto menu_autoid_Q9
                    ) else if %menu_wifi_autoid_Q9%==00 (
                        rem thoát
                        exit
                    ) else (
                        cls
                        echo.
                        echo.
                        echo                LUA CHON BAN NHAP VAO KHONG HOP LE
                        echo                        VUI LONG NHAP LAI !
                        goto menu_wifi_autoid_Q9
                    )

            rem ==============================================================================================================================
                rem ============== 2.2.1 menu_back_menu_autoid_Q9 ============================================================================
                    :menu_back_menu_wifi_autoid_Q9
                    echo.
                    echo.
                    echo.
                    echo ======================= HOAN THANH ! =======================
                    echo.
                    echo.
                    echo.
                    echo  0:  QUAY LAI
                    echo 00:  THOAT
                    echo.
                    echo.
                    set /p menu_back_menu_wifi_autoid_Q9=" VUI LONG NHAP LUA CHON CUA BAN :   "
                        if %menu_back_menu_wifi_autoid_Q9%==0 (
                            rem quay lại menu chính
                            cls
                            goto menu_wifi_autoid_Q9
                        ) else if %menu_back_menu_wifi_autoid_Q9%==00 (
                            rem thoát
                            exit
                        ) else (
                            cls
                            echo.
                            echo.
                            echo                LUA CHON BAN NHAP VAO KHONG HOP LE
                            echo                        VUI LONG NHAP LAI !
                            goto menu_back_menu_wifi_autoid_Q9
                        )

                rem ==========================================================================================================================
            rem ============== 2.3 menu_cai_giay_autoid_Q9 ===================================================================================
                :menu_cai_giay_autoid_Q9
                echo.
                echo.
                echo.
                echo ============================================================
                echo.
                echo.
                echo  1:  BAT GIAY TREN THANH THONG BAO
                echo  2:  TAT GIAY TREN THANH THONG BAO
                echo.
                echo  0:  QUAY LAI
                echo 00:  THOAT
                echo.
                echo.
                set /p menu_cai_giay_autoid_Q9=" VUI LONG NHAP LUA CHON CUA BAN :   "
                    if %menu_cai_giay_autoid_Q9%==1 (
                        rem cài giây trên thanh thông báo
                        cls
                         adb shell settings put secure clock_seconds 1
                        goto menu_back_menu_cai_giay_autoid_Q9
                    ) else if %menu_cai_giay_autoid_Q9%==2 (
                        rem tắt giây trên thanh thông báo
                        cls
                         adb shell settings put secure clock_seconds 0
                        goto menu_back_menu_cai_giay_autoid_Q9
                    ) else if %menu_cai_giay_autoid_Q9%==0 (
                        rem quay lại menu chính
                        cls
                        goto menu_autoid_Q9
                    ) else if %menu_cai_giay_autoid_Q9%==00 (
                        rem thoát
                        exit
                    ) else (
                        cls
                        echo.
                        echo.
                        echo                LUA CHON BAN NHAP VAO KHONG HOP LE
                        echo                        VUI LONG NHAP LAI !
                        goto menu_cai_giay_autoid_Q9
                    )

            rem ==============================================================================================================================
                rem ============== 2.3.1 menu_back_menu_autoid_Q9 ============================================================================
                    :menu_back_menu_cai_giay_autoid_Q9
                    echo.
                    echo.
                    echo.
                    echo ======================= HOAN THANH ! =======================
                    echo.
                    echo.
                    echo.
                    echo  0:  QUAY LAI
                    echo 00:  THOAT
                    echo.
                    echo.
                    set /p menu_back_menu_cai_giay_autoid_Q9=" VUI LONG NHAP LUA CHON CUA BAN :   "
                        if %menu_back_menu_cai_giay_autoid_Q9%==0 (
                            rem quay lại menu chính
                            cls
                            goto menu_cai_giay_autoid_Q9
                        ) else if %menu_back_menu_cai_giay_autoid_Q9%==00 (
                            rem thoát
                            exit
                        ) else (
                            cls
                            echo.
                            echo.
                            echo                LUA CHON BAN NHAP VAO KHONG HOP LE
                            echo                        VUI LONG NHAP LAI !
                            goto menu_back_menu_cai_giay_autoid_Q9
                        )

                rem ==========================================================================================================================
            rem ============== 2.4 menu_install_app_autoid_Q9 ================================================================================
                :menu_install_app_autoid_Q9
                echo.
                echo.
                echo.
                echo ============================================================
                echo.
                echo.
                echo  1:  GO CAI DAT APP JT SPRINTER BAN CU (*)
                echo  2:  CAI DAT APP JT SPRINTER BAN CU   [%JTSprinter_version_cu%] (*)
                echo  3:  CAI DAT APP JT SPRINTER BAN MOI   [%JTSprinter_version_new%] (*)
                echo  4:  GO CAI DAT BAN MOI (*)
                echo  5:  CAI DAT APP KHAC
                echo  6:  GO CAI DAT APP KHAC
                echo.
                echo  0:  QUAY LAI
                echo 00:  THOAT
                echo.
                echo.
                set /p menu_install_app_autoid_Q9=" VUI LONG NHAP LUA CHON CUA BAN :   "
                    if %menu_install_app_autoid_Q9%==1 (
                        rem GO CAI DAT APP JT SPRINTER BAN CU
                        cls
                         adb uninstall "%packages_name_JT_cu_autoid_Q9%"
                         rem adb uninstall cn.yssoft.vietnam
                        goto menu_back_menu_install_app_autoid_Q9
                    ) else if %menu_install_app_autoid_Q9%==2 (
                        rem cài đặt ứng dụng JT SPRINTER bản củ
                        cls
                         adb install -r "%duong_dan_app_ban_cu%"
                        goto menu_back_menu_install_app_autoid_Q9
                    ) else if %menu_install_app_autoid_Q9%==3 (
                        rem cài đặt ứng dụng JT SPRINTER bản mới
                        cls
                         adb install -r "%duong_dan_app_ban_moi%"
                    ) else if %menu_install_app_autoid_Q9%==4 (
                        rem gỡ cài đặt ứng dụng mới
                        cls
                         adb uninstall com.jt.express.vietnam.outfield
                    ) else if %menu_install_app_autoid_Q9%==5 (
                        rem CAI DAT APP KHAC
                        cls
                        goto menu_back_menu_install_another_app_autoid_Q9
                    ) else if %menu_install_app_autoid_Q9%==6 (
                        rem gỡ cài đặt app khác
                        cls
                        goto menu_back_menu_uninstall_another_app_autoid_Q9
                    ) else if %menu_install_app_autoid_Q9%==0 (
                        rem quay lại menu chính
                        cls
                        goto menu_autoid_Q9 
                    ) else if %menu_install_app_autoid_Q9%==00 (
                        rem thoát
                        exit
                    ) else (
                        cls
                        echo.
                        echo.
                        echo                LUA CHON BAN NHAP VAO KHONG HOP LE
                        echo                        VUI LONG NHAP LAI !
                        goto menu_install_app_autoid_Q9
                    )

            rem ==============================================================================================================================
                rem ============== 2.4.1 menu_back_menu_install_app_autoid_Q9 ================================================================
                    :menu_back_menu_install_app_autoid_Q9                          
                    echo.
                    echo.
                    echo.
                    echo ======================= HOAN THANH ! =======================
                    echo *********************** LUU Y !!!!!! ***********************
                    echo.
                    echo.
                    echo.
                    echo  0:  QUAY LAI
                    echo 00:  THOAT
                    echo.
                    echo.
                    set /p menu_back_menu_install_app_autoid_Q9=" VUI LONG NHAP LUA CHON CUA BAN :   "
                        if %menu_back_menu_install_app_autoid_Q9%==0 (
                            rem quay lại menu chính
                            cls
                            goto menu_install_app_autoid_Q9
                        ) else if %menu_back_menu_install_app_autoid_Q9%==00 (
                            rem thoát
                            exit
                        ) else (
                            cls
                            echo.
                            echo.
                            echo                LUA CHON BAN NHAP VAO KHONG HOP LE
                            echo                        VUI LONG NHAP LAI !
                            goto menu_back_menu_install_app_autoid_Q9
                        )

                rem ==========================================================================================================================
                rem ============== 2.4.2 menu_back_menu_install_another_app_autoid_Q9 ========================================================
                    :menu_back_menu_install_another_app_autoid_Q9
                    cls
                    echo.
                    echo.
                    echo VUI LONG NHAP DUONG DAN CUA UNG DUNG BAN MUON CAI DAT
                    echo      * NHAP 'back' DE QUAY LAI
                    echo      * NHAP 'exit' DE THOAT
                    echo.
                    set /p install_another_app_autoid_Q9="path install: "
                        if "%install_another_app_autoid_Q9%"=="back" (
                            cls
                            goto menu_install_app_autoid_Q9
                        ) else if "%install_another_app_autoid_Q9%"=="exit" (
                            cls
                            exit
                        ) else (
                                adb install  "%install_another_app_autoid_Q9%"
                            if ERRORLEVEL 1 (
                                cls
                                echo LOI: Khong the cai dat ung dung. Vui long kiem tra duong dan hoac thu lai.
                                goto menu_back_menu_install_another_app_autoid_Q9
                            ) else (
                                echo.
                                echo.
                                echo         ********** Ung dung da duoc cai dat thanh cong **********
                            )
                            goto menu_back_menu_install_another_app_done_autoid_Q9
                        )

                rem ==========================================================================================================================
                rem ============== 2.4.3 menu_back_menu_install_another_app_done_autoid_Q9 ===================================================
                    :menu_back_menu_install_another_app_done_autoid_Q9
                    echo.
                    echo ============================================================
                    echo.
                    echo.
                    echo  1:  TIEP TUC
                    echo.
                    echo  0:  QUAY LAI
                    echo 00:  THOAT
                    set /p menu_back_menu_install_another_app_done_autoid_Q9=" VUI LONG NHAP LUA CHON CUA BAN :   "
                        if %menu_back_menu_install_another_app_done_autoid_Q9%==1 (
                            rem tiếp tục nhập tiếp
                            cls
                            goto menu_back_menu_install_another_app_autoid_Q9
                        ) else if %menu_back_menu_install_another_app_done_autoid_Q9%==0 (
                            rem quay lại menu chính
                            cls
                            goto menu_install_app_autoid_Q9
                        ) else if %menu_back_menu_install_another_app_done_autoid_Q9%==00 (
                            rem thoát
                            exit
                        ) else (
                            cls
                            echo.
                            echo.
                            echo                LUA CHON BAN NHAP VAO KHONG HOP LE
                            echo                        VUI LONG NHAP LAI !
                            goto menu_back_menu_install_another_app_done_autoid_Q9
                        )

                rem ==========================================================================================================================
                rem ============== 2.4.4 menu_back_menu_uninstall_app_autoid_Q9 ==============================================================
                    :menu_back_menu_uninstall_app_autoid_Q9                           
                    echo.
                    echo.
                    echo.
                    echo ======================= HOAN THANH ! =======================
                    echo *********************** LUU Y !!!!!! ***********************
                    echo.
                    echo.
                    echo.
                    echo  0:  QUAY LAI
                    echo 00:  THOAT
                    echo.
                    echo.
                    set /p menu_back_menu_uninstall_app_autoid_Q9=" VUI LONG NHAP LUA CHON CUA BAN :   "
                        if %menu_back_menu_uninstall_app_autoid_Q9%==0 (
                            rem quay lại menu chính
                            cls
                            goto menu_install_app_autoid_Q9
                        ) else if %menu_back_menu_uninstall_app_autoid_Q9%==00 (
                            rem thoát
                            exit
                        ) else (
                            cls
                            echo.
                            echo.
                            echo                LUA CHON BAN NHAP VAO KHONG HOP LE
                            echo                        VUI LONG NHAP LAI !
                            goto menu_back_menu_uninstall_app_autoid_Q9
                        )

                rem ==========================================================================================================================
                rem ============== 2.4.5 menu_back_menu_uninstall_another_app_autoid_Q9 ======================================================
                    :menu_back_menu_uninstall_another_app_autoid_Q9
                    cls
                                adb shell pm list packages -3
                    echo ************************************************************
                    echo.
                    echo.
                    echo VUI LONG NHAP PACKAGES NAME CUA UNG DUNG BAN MUON GO CAI DAT
                    echo      * NHAP 'back' DE QUAY LAI
                    echo      * NHAP 'exit' DE THOAT
                    echo.
                    set /p uninstall_another_app_autoid_Q9="packages name uninstall: "
                        if "%uninstall_another_app_autoid_Q9%"=="back" (
                            cls
                            goto menu_install_app_autoid_Q9
                        ) else if "%uninstall_another_app_autoid_Q9%"=="exit" (
                            cls
                            exit
                        ) else (
                                adb shell pm list packages -3
                            echo ************************************************************
                                adb uninstall "%uninstall_another_app_autoid_Q9%"
                            if ERRORLEVEL 1 (
                                cls
                                echo LOI: Khong the go cai dat ung dung. Vui long kiem tra packages name hoac thu lai.
                                goto menu_back_menu_uninstall_another_app_autoid_Q9
                            ) else (
                                echo.
                                echo.
                                echo         ********** Ung dung da duoc go cai dat thanh cong **********
                            )
                            goto menu_back_menu_uninstall_another_app_done_autoid_Q9
                        )

                rem ==========================================================================================================================
                rem ============== 2.4.6 menu_back_menu_uninstall_another_app_done_autoid_Q9 =================================================
                    :menu_back_menu_uninstall_another_app_done_autoid_Q9
                    echo.
                    echo ============================================================
                    echo.
                    echo.
                    echo  1:  TIEP TUC
                    echo.
                    echo  0:  QUAY LAI
                    echo 00:  THOAT
                    set /p menu_back_menu_uninstall_another_app_done_autoid_Q9=" VUI LONG NHAP LUA CHON CUA BAN :   "
                        if %menu_back_menu_uninstall_another_app_done_autoid_Q9%==1 (
                            rem tiếp tục nhập tiếp
                            cls
                            goto menu_back_menu_uninstall_another_app_autoid_Q9
                        ) else if %menu_back_menu_uninstall_another_app_done_autoid_Q9%==0 (
                            rem quay lại menu chính
                            cls
                            goto menu_install_app_autoid_Q9
                        ) else if %menu_back_menu_uninstall_another_app_done_autoid_Q9%==00 (
                            rem thoát
                            exit
                        ) else (
                            cls
                            echo.
                            echo.
                            echo                LUA CHON BAN NHAP VAO KHONG HOP LE
                            echo                        VUI LONG NHAP LAI !
                            goto menu_back_menu_uninstall_another_app_done_autoid_Q9
                        )

                rem ==========================================================================================================================
            rem ============== 2.5 menu_hidden_show_app_autoid_Q9 (*) ========================================================================
                :menu_hidden_show_app_autoid_Q9
                echo.
                echo.
                echo.
                echo ============================================================
                echo.
                echo.
                echo  1:  AN UNG DUNG DA DUOC SETUP (*)
                echo  2:  HIEN THI LAI UNG DUNG DA DUOC SETUP (*)
                echo  3:  AN UNG DUNG KHAC (nhung ung dung khong duoc SETUP)
                echo  4:  HIEN THI UNG DUNG KHAC (nhung ung dung khong duoc SETUP)
                echo  5:  HIEN DANH SACH NHUNG UNG DUNG DA "disable-user"
                echo.
                echo  0:  QUAY LAI
                echo 00:  THOAT
                echo.
                echo.
                set /p menu_hidden_show_app_autoid_Q9=" VUI LONG NHAP LUA CHON CUA BAN :   "
                    if %menu_hidden_show_app_autoid_Q9%==1 (
                        rem ẩn ứng dụng đã setup trước
                        cls
                        goto menu_an_ung_dung_da_setup_autoid_Q9
                    ) else if %menu_hidden_show_app_autoid_Q9%==2 (
                        rem hiện những ứng dụng đã được setup
                        cls
                        goto menu_hien_ung_dung_da_setup_autoid_Q9
                    ) else if %menu_hidden_show_app_autoid_Q9%==3 (
                        rem ẩn những ứng dụng không được thiết lập sẵn
                        cls
                        goto menu_an_ung_dung_khong_duoc_setup_autoid_Q9
                    ) else if %menu_hidden_show_app_autoid_Q9%==4 (
                        rem hiện những ứng dụng không được thiết lập sẵn
                        cls
                        goto menu_hien_ung_dung_khong_duoc_setup_autoid_Q9
                    ) else if %menu_hidden_show_app_autoid_Q9%==5 (
                        rem hiện danh sách những ứng dụng đã dùng lệnh adb shell pm disable-user
                        cls
                        goto menu_danh_sach_ung_dung_da_disable_autoid_Q9
                    ) else if %menu_hidden_show_app_autoid_Q9%==0 (
                        rem quay lại menu chính
                        cls
                        goto menu_autoid_Q9
                    ) else if %menu_hidden_show_app_autoid_Q9%==00 (
                        rem thoát
                        exit
                    ) else (
                        cls
                        echo.
                        echo.
                        echo                LUA CHON BAN NHAP VAO KHONG HOP LE
                        echo                        VUI LONG NHAP LAI !
                        goto menu_hidden_show_app_autoid_Q9
                    )

            rem ==============================================================================================================================
                rem ============== 2.5.1 menu_an_ung_dung_da_setup_autoid_Q9 =================================================================
                    :menu_an_ung_dung_da_setup_autoid_Q9
                    echo.
                    echo.
                    echo ==================== Xac nhan thuc hien ====================
                    echo.
                    echo Nhung ung dung se duoc an
                    echo    * Chrome
                    echo    * Google Play
                    echo    * Google Drive
                    echo    * Email
                    echo    * Duo
                    echo    * Tro Ly
                    echo    * Google
                    echo    * Bo cong cu SIM
                    echo    * Youtube
                    echo    * YT Music
                    echo    * Play Phim
                    echo.
                    echo.
                    echo  1:  XAC NHAN TIEP TUC THAO TAC
                    echo.
                    echo  0:  QUAY LAI
                    echo 00:  THOAT
                    echo.
                    echo.
                    set /p menu_an_ung_dung_da_setup_autoid_Q9=" VUI LONG NHAP LUA CHON CUA BAN :   "
                        if %menu_an_ung_dung_da_setup_autoid_Q9%==1 (
                            rem ẩn ứng dụng khi đã được xác nhận
                            cls
                             adb shell pm disable-user com.android.chrome
                             adb shell pm disable-user com.android.vending
                             adb shell pm disable-user com.google.android.apps.docs
                             adb shell pm disable-user com.google.android.gm
                             adb shell pm disable-user com.google.android.apps.googleassistant
                             adb shell pm disable-user com.google.android.gms
                             adb shell pm disable-user com.android.stk
                             adb shell pm disable-user com.google.android.apps.youtube.music
                             adb shell pm disable-user com.google.android.videos
                             adb shell pm disable-user com.google.android.youtube
                             adb shell pm disable-user com.android.cellbroadcastreceiver
                             adb shell pm disable-user com.google.android.apps.tachyon
                             adb shell pm disable-user com.google.android.googlequicksearchbox
                             adb shell pm disable-user com.google.android.apps.maps
                            goto menu_back_menu_an_ung_dung_da_setup_autoid_Q9
                        ) else if %menu_an_ung_dung_da_setup_autoid_Q9%==0 (
                            rem quay lại menu trước
                            cls
                            goto menu_hidden_show_app_autoid_Q9
                        ) else if %menu_an_ung_dung_da_setup_autoid_Q9%==00 (
                            rem thoát tools
                            exit
                        ) else (
                            cls
                            echo.
                            echo.
                            echo                LUA CHON BAN NHAP VAO KHONG HOP LE
                            echo                        VUI LONG NHAP LAI !
                            goto menu_an_ung_dung_da_setup_autoid_Q9
                        )

                        rem ============== menu_back_menu_an_ung_dung_da_setup_autoid_Q9 =====================================================
                            :menu_back_menu_an_ung_dung_da_setup_autoid_Q9
                            cls
                            echo.
                            echo.
                            echo ======================= HOAN THANH ! =======================
                            echo.
                            echo.
                            echo  1:  TIEP TUC
                            echo.
                            echo  0:  QUAY LAI
                            echo 00:  THOAT
                            echo.
                            echo.
                            set /p menu_back_menu_an_ung_dung_da_setup_autoid_Q9=" VUI LONG NHAP LUA CHON CUA BAN :   "
                                if %menu_back_menu_an_ung_dung_da_setup_autoid_Q9%==1 (
                                    cls
                                    rem tiếp tục chạy tiếp
                                     adb shell pm disable-user com.android.browser
                                    goto menu_back_menu_an_ung_dung_da_setup_autoid_Q9
                                ) else if %menu_back_menu_an_ung_dung_da_setup_autoid_Q9%==0 (
                                    rem quay lại menu
                                    cls
                                    goto menu_hidden_show_app_autoid_Q9
                                ) else if %menu_back_menu_an_ung_dung_da_setup_autoid_Q9%==00 (
                                    rem thoát
                                    exit
                                ) else (
                                    cls
                                    echo.
                                    echo.
                                    echo                LUA CHON BAN NHAP VAO KHONG HOP LE
                                    echo                        VUI LONG NHAP LAI !
                                    goto menu_back_menu_an_ung_dung_da_setup_autoid_Q9
                                )

                        rem ==================================================================================================================
                rem ==========================================================================================================================
                rem ============== 2.5.2 menu_hien_ung_dung_da_setup_autoid_Q9 ===============================================================
                    :menu_hien_ung_dung_da_setup_autoid_Q9
                    echo.
                    echo.
                    echo ==================== Xac nhan thuc hien ====================
                    echo.
                    echo Nhung ung dung se duoc hien thi
                    echo    * Chrome
                    echo    * Google Play
                    echo    * Google Drive
                    echo    * Email
                    echo    * Duo
                    echo    * Tro Ly
                    echo    * Google
                    echo    * Bo cong cu SIM
                    echo    * Youtube
                    echo    * YT Music
                    echo    * Play Phim
                    echo.
                    echo.
                    echo  1:  XAC NHAN TIEP TUC THAO TAC
                    echo.
                    echo  0:  QUAY LAI
                    echo 00:  THOAT
                    echo.
                    echo.
                    set /p menu_hien_ung_dung_da_setup_autoid_Q9=" VUI LONG NHAP LUA CHON CUA BAN :   "
                        if %menu_hien_ung_dung_da_setup_autoid_Q9%==1 (
                            rem hiện ứng dụng khi đã được xác nhận
                            cls
                             adb shell pm enable com.android.browser
                            goto menu_back_menu_hien_ung_dung_da_setup_autoid_Q9
                        ) else if %menu_hien_ung_dung_da_setup_autoid_Q9%==0 (
                            rem quay lại menu trước
                            cls
                            goto menu_hidden_show_app_autoid_Q9
                        ) else if %menu_hien_ung_dung_da_setup_autoid_Q9%==00 (
                            rem thoát tools
                            exit
                        ) else (
                            cls
                            echo.
                            echo.
                            echo                LUA CHON BAN NHAP VAO KHONG HOP LE
                            echo                        VUI LONG NHAP LAI !
                            goto menu_hien_ung_dung_da_setup_autoid_Q9
                        )

                        rem ============== menu_back_menu_hien_ung_dung_da_setup_autoid_Q9 =============================================================
                            :menu_back_menu_hien_ung_dung_da_setup_autoid_Q9
                            cls
                            echo.
                            echo.
                            echo ======================= HOAN THANH ! =======================
                            echo.
                            echo.
                            echo  1:  TIEP TUC
                            echo.
                            echo  0:  QUAY LAI
                            echo 00:  THOAT
                            echo.
                            echo.
                            set /p menu_back_menu_hien_ung_dung_da_setup_autoid_Q9=" VUI LONG NHAP LUA CHON CUA BAN :   "
                                if %menu_back_menu_hien_ung_dung_da_setup_autoid_Q9%==1 (
                                    cls
                                    rem tiếp tục chạy tiếp
                                     adb shell pm enable com.android.chrome
                                     adb shell pm enable com.android.vending
                                     adb shell pm enable com.google.android.apps.docs
                                     adb shell pm enable com.google.android.gm
                                     adb shell pm enable com.google.android.apps.googleassistant
                                     adb shell pm enable com.google.android.gms
                                     adb shell pm enable com.android.stk
                                     adb shell pm enable com.google.android.apps.youtube.music
                                     adb shell pm enable com.google.android.videos
                                     adb shell pm enable com.google.android.youtube
                                     adb shell pm enable com.android.cellbroadcastreceiver
                                     adb shell pm enable com.google.android.apps.tachyon
                                     adb shell pm enable com.google.android.googlequicksearchbox
                                     adb shell pm enable com.google.android.apps.maps

                                    goto menu_back_menu_hien_ung_dung_da_setup_autoid_Q9
                                ) else if %menu_back_menu_hien_ung_dung_da_setup_autoid_Q9%==0 (
                                    rem quay lại menu
                                    cls
                                    goto menu_hidden_show_app_autoid_Q9
                                ) else if %menu_back_menu_hien_ung_dung_da_setup_autoid_Q9%==00 (
                                    rem thoát
                                    exit
                                ) else (
                                    cls
                                    echo.
                                    echo.
                                    echo                LUA CHON BAN NHAP VAO KHONG HOP LE
                                    echo                        VUI LONG NHAP LAI !
                                    goto menu_back_menu_hien_ung_dung_da_setup_autoid_Q9
                                )

                rem ==========================================================================================================================
                rem ============== 2.5.3 menu_an_ung_dung_khong_duoc_setup_autoid_Q9 =========================================================
                        :menu_an_ung_dung_khong_duoc_setup_autoid_Q9
                        cls
                         adb shell pm list packages                                    
                        echo ************************************************************
                        echo.
                        echo.
                        echo VUI LONG NHAP PACKAGES NAME CUA UNG DUNG BAN MUON AN
                        echo      * NHAP 'back' DE QUAY LAI
                        echo      * NHAP 'exit' DE THOAT
                        echo.
                        set /p an_ung_dung_khong_duoc_setup_autoid_Q9="packages name hidden: "
                            if "%an_ung_dung_khong_duoc_setup_autoid_Q9%"=="back" (
                                cls
                                goto menu_hidden_show_app_autoid_Q9
                            ) else if "%an_ung_dung_khong_duoc_setup_autoid_Q9%"=="exit" (
                                cls
                                exit
                            ) else (
                                 adb shell pm list packages
                                echo ************************************************************
                                 adb shell pm disable-user "%an_ung_dung_khong_duoc_setup_autoid_Q9%"
                                if ERRORLEVEL 1 (
                                    cls
                                    echo LOI: Khong the an ung dung. Vui long kiem tra packages name hoac thu lai.
                                    goto menu_an_ung_dung_khong_duoc_setup_autoid_Q9
                                ) else (
                                    cls
                                    echo.
                                    echo.
                                    echo         ********** Ung dung da duoc an thanh cong **********
                                )
                                goto menu_an_ung_dung_khong_duoc_setup_done_autoid_Q9
                            )

                rem ==========================================================================================================================
                    rem ==============2.5.3.1 menu_an_ung_dung_khong_duoc_setup_done_autoid_Q9 ===============================================
                        :menu_an_ung_dung_khong_duoc_setup_done_autoid_Q9
                        echo.
                        echo ============================================================
                        echo.
                        echo.
                        echo  1:  TIEP TUC
                        echo.
                        echo  0:  QUAY LAI
                        echo 00:  THOAT
                        set /p menu_an_ung_dung_khong_duoc_setup_done_autoid_Q9=" VUI LONG NHAP LUA CHON CUA BAN :   "
                            if %menu_an_ung_dung_khong_duoc_setup_done_autoid_Q9%==1 (
                                rem tiếp tục nhập tiếp
                                cls
                                goto menu_back_menu_menu_an_ung_dung_khong_duoc_setup_autoid_Q9
                            ) else if %menu_an_ung_dung_khong_duoc_setup_done_autoid_Q9%==0 (
                                rem quay lại menu chính
                                cls
                                goto menu_hidden_show_app_autoid_Q9
                            ) else if %menu_an_ung_dung_khong_duoc_setup_done_autoid_Q9%==00 (
                                rem thoát
                                exit
                            ) else (
                                cls
                                echo.
                                echo.
                                echo                LUA CHON BAN NHAP VAO KHONG HOP LE
                                echo                        VUI LONG NHAP LAI !
                                goto menu_an_ung_dung_khong_duoc_setup_done_autoid_Q9
                            )

                    rem ======================================================================================================================
                rem ============== 2.5.4 menu_hien_ung_dung_khong_duoc_setup_autoid_Q9 =======================================================
                    :menu_hien_ung_dung_khong_duoc_setup_autoid_Q9
                    cls
                     adb shell pm list packages -d
                    echo ************************************************************
                    echo.
                    echo.
                    echo VUI LONG NHAP PACKAGES NAME CUA UNG DUNG BAN MUON HIEN
                    echo      * NHAP 'back' DE QUAY LAI
                    echo      * NHAP 'exit' DE THOAT
                    echo.
                    set /p hien_ung_dung_khong_duoc_setup_autoid_Q9="packages name show: "
                        if "%hien_ung_dung_khong_duoc_setup_autoid_Q9%"=="back" (
                            cls
                            goto menu_hidden_show_app_autoid_Q9
                        ) else if "%hien_ung_dung_khong_duoc_setup_autoid_Q9%"=="exit" (
                            cls
                            exit
                        ) else (
                             adb shell pm list packages -d
                            echo ************************************************************
                             adb shell pm enable "%hien_ung_dung_khong_duoc_setup_autoid_Q9%"
                            if ERRORLEVEL 1 (
                                cls
                                echo LOI: Khong the hien ung dung. Vui long kiem tra packages name hoac thu lai.
                                goto menu_hien_ung_dung_khong_duoc_setup_autoid_Q9
                            ) else (
                                cls
                                echo.
                                echo.
                                echo         ********** Ung dung da duoc hien thanh cong **********
                            )
                            goto menu_hien_ung_dung_khong_duoc_setup_done_autoid_Q9
                        )

                rem ==========================================================================================================================
                    rem ============== 2.5.4.1 menu_hien_ung_dung_khong_duoc_setup_done_autoid_Q9 ============================================
                        :menu_hien_ung_dung_khong_duoc_setup_done_autoid_Q9
                        echo.
                        echo ============================================================
                        echo.
                        echo.
                        echo  1:  TIEP TUC
                        echo.
                        echo  0:  QUAY LAI
                        echo 00:  THOAT
                        set /p menu_hien_ung_dung_khong_duoc_setup_done_autoid_Q9=" VUI LONG NHAP LUA CHON CUA BAN :   "
                            if %menu_hien_ung_dung_khong_duoc_setup_done_autoid_Q9%==1 (
                                rem tiếp tục nhập tiếp
                                cls
                                goto menu_back_menu_menu_hien_ung_dung_khong_duoc_setup_autoid_Q9
                            ) else if %menu_hien_ung_dung_khong_duoc_setup_done_autoid_Q9%==0 (
                                rem quay lại menu chính
                                cls
                                goto menu_hidden_show_app_autoid_Q9
                            ) else if %menu_hien_ung_dung_khong_duoc_setup_done_autoid_Q9%==00 (
                                rem thoát
                                exit
                            ) else (
                                cls
                                echo.
                                echo.
                                echo                LUA CHON BAN NHAP VAO KHONG HOP LE
                                echo                        VUI LONG NHAP LAI !
                                goto menu_hien_ung_dung_khong_duoc_setup_done_autoid_Q9
                            )

                    rem ======================================================================================================================
                rem ============== 2.5.5 menu_danh_sach_ung_dung_da_disable_autoid_Q9 ========================================================
                    :menu_danh_sach_ung_dung_da_disable_autoid_Q9
                    adb shell pm list packages -d
                    echo.
                    echo ============================================================
                    echo.
                    echo  0:  QUAY LAI
                    echo 00:  THOAT
                    echo.
                    echo.
                    set /p menu_danh_sach_ung_dung_da_disable_autoid_Q9=" VUI LONG NHAP LUA CHON CUA BAN :   "
                        if %menu_danh_sach_ung_dung_da_disable_autoid_Q9%==0 (
                            rem quay lại menu chính
                            cls
                            goto menu_hidden_show_app_autoid_Q9
                        ) else if %menu_danh_sach_ung_dung_da_disable_autoid_Q9%==00 (
                            rem thoát
                            exit
                        ) else (
                            cls
                            echo.
                            echo.
                            echo                LUA CHON BAN NHAP VAO KHONG HOP LE
                            echo                        VUI LONG NHAP LAI !
                            goto menu_danh_sach_ung_dung_da_disable_autoid_Q9
                        )

                rem ==========================================================================================================================
            rem ==============================================================================================================================
            rem ============== 2.6 menu_delete_app_autoid_Q9 (*) =============================================================================
                :menu_delete_app_autoid_Q9
                echo.
                echo.
                echo.
                echo ============================================================
                echo.
                echo.
                echo  1:  XOA UNG DUNG DA DUOC SETUP (*)
                echo  2:  XOA UNG DUNG KHAC 
                echo.
                echo  0:  QUAY LAI
                echo 00:  THOAT
                echo.
                echo.
                set /p menu_delete_app_autoid_Q9=" VUI LONG NHAP LUA CHON CUA BAN :   "
                     if %menu_delete_app_autoid_Q9%==1 (
                        cls
                        goto xoa_ung_dung_da_setup_autoid_Q9
                     ) else if %menu_delete_app_autoid_Q9%==2 (
                        cls
                        goto xoa_ung_dung_khac_autoid_Q9
                     ) else if %menu_delete_app_autoid_Q9%==0 (
                        rem quay lại menu chính
                        cls
                        goto menu_autoid_Q9
                    ) else if %menu_delete_app_autoid_Q9%==00 (
                        rem thoát
                        exit
                    ) else (
                        cls
                        echo.
                        echo.
                        echo                LUA CHON BAN NHAP VAO KHONG HOP LE
                        echo                        VUI LONG NHAP LAI !
                        goto menu_delete_app_autoid_Q9
                    )

            rem ==============================================================================================================================
                rem ============== 2.6.1 xoa_ung_dung_da_setup_autoid_Q9 =====================================================================
                    :xoa_ung_dung_da_setup_autoid_Q9
                    echo.
                    echo.
                    echo.
                    echo ==================== Xac nhan thuc hien ====================
                    echo.
                    echo.
                    echo Nhung ung dung se duoc XOA
                    echo    * Chrome
                    echo    * Goole Play
                    echo.
                    echo.
                    echo  1:  XAC NHAN TIEP TUC THAO TAC
                    echo.
                    echo  0:  QUAY LAI
                    echo 00:  THOAT
                    echo.
                    echo.
                    set /p xoa_ung_dung_da_setup_autoid_Q9=" VUI LONG NHAP LUA CHON CUA BAN :   "
                        if %xoa_ung_dung_da_setup_autoid_Q9%==1 (
                            rem xóa ứng dụng đã được setup sẵn khỏi thiếp bị
                            cls
                            adb shell pm uninstall -k --user 0 com.android.chrome
                            adb shell pm uninstall -k --user 0 com.android.vending
                            adb shell pm uninstall -k --user 0 com.google.android.gms
                            rem bổ sung các ứng dụng bạn muốn xóa khác vào đây
                            cls
                            goto xoa_ung_dung_da_setup_done_autoid_Q9
                        ) else if %xoa_ung_dung_da_setup_autoid_Q9%==0 (
                            cls
                            goto menu_delete_app_autoid_Q9
                        ) else if %xoa_ung_dung_da_setup_autoid_Q9%==00 (
                            rem thoát
                            exit
                        ) else (
                            cls
                            echo.
                            echo.
                            echo                LUA CHON BAN NHAP VAO KHONG HOP LE
                            echo                        VUI LONG NHAP LAI !
                            goto xoa_ung_dung_da_setup_autoid_Q9
                        )

                rem ==========================================================================================================================
                rem ============== 2.6.2 xoa_ung_dung_khac_autoid_Q9 =========================================================================
                    :xoa_ung_dung_khac_autoid_Q9
                    cls
                     adb shell pm list packages
                    echo ************************************************************
                    echo.
                    echo.
                    echo VUI LONG NHAP PACKAGES NAME CUA UNG DUNG BAN MUON GO CAI DAT
                    echo      * NHAP 'back' DE QUAY LAI
                    echo      * NHAP 'exit' DE THOAT
                    echo.
                    set /p uninstall_another_app_autoid_Q9="packages name uninstall: "
                        if "%uninstall_another_app_autoid_Q9%"=="back" (
                            cls
                            goto menu_delete_app_autoid_Q9
                        ) else if "%uninstall_another_app_autoid_Q9%"=="exit" (
                            cls
                            exit
                        ) else (
                             adb shell pm list packages -3
                            echo ************************************************************
                             adb shell pm uninstall -k --user 0 "%uninstall_another_app_autoid_Q9%"
                            if ERRORLEVEL 1 (
                                cls
                                echo LOI: Khong the go cai dat ung dung. Vui long kiem tra packages name hoac thu lai.
                                goto menu_back_menu_uninstall_another_app_autoid_Q9
                            ) else (
                                echo.
                                echo.
                                echo         ********** Ung dung da duoc go cai dat thanh cong **********
                            )
                                goto menu_back_menu_uninstall_another_app_done_autoid_Q9
                        )

                rem ==========================================================================================================================
                    rem ============== 2.6.1.1 xoa_ung_dung_da_setup_done_autoid_Q9 ==========================================================
                        :xoa_ung_dung_da_setup_done_autoid_Q9
                        echo.
                        echo.
                        echo.
                        echo ======================= HOAN THANH ! =======================
                        echo.
                        echo.
                        echo.
                        echo  0:  QUAY LAI
                        echo 00:  THOAT
                        echo.
                        echo.
                        set /p xoa_ung_dung_da_setup_done_autoid_Q9=" VUI LONG NHAP LUA CHON CUA BAN :   "
                            if %xoa_ung_dung_da_setup_done_autoid_Q9%==0 (
                                rem quay lại menu chính
                                cls
                                goto xoa_ung_dung_da_setup_autoid_Q9
                            ) else if %xoa_ung_dung_da_setup_done_autoid_Q9%==00 (
                                rem thoát
                                exit
                            ) else (
                                cls
                                echo.
                                echo.
                                echo                LUA CHON BAN NHAP VAO KHONG HOP LE
                                echo                        VUI LONG NHAP LAI !
                                goto xoa_ung_dung_da_setup_done_autoid_Q9
                            )

                    rem ======================================================================================================================
                    rem ============== 2.6.2.1 xoa_ung_dung_khac_done_autoid_Q9 ==============================================================
                        :xoa_ung_dung_khac_done_autoid_Q9
                        cls
                        echo.
                        echo ============================================================
                        echo.
                        echo.
                        echo  1:  TIEP TUC
                        echo.
                        echo  0:  QUAY LAI
                        echo 00:  THOAT
                        set /p xoa_ung_dung_khac_done_autoid_Q9=" VUI LONG NHAP LUA CHON CUA BAN :   "
                            if %xoa_ung_dung_khac_done_autoid_Q9%==1 (
                                rem tiếp tục nhập tiếp
                                cls
                                goto xoa_ung_dung_khac_autoid_Q9
                            ) else if %xoa_ung_dung_khac_done_autoid_Q9%==0 (
                                rem quay lại menu chính
                                cls
                                goto menu_delete_app_autoid_Q9
                            ) else if %xoa_ung_dung_khac_done_autoid_Q9%==00 (
                                rem thoát
                                exit
                            ) else (
                                cls
                                echo.
                                echo.
                                echo                LUA CHON BAN NHAP VAO KHONG HOP LE
                                echo                        VUI LONG NHAP LAI !
                                goto xoa_ung_dung_khac_done_autoid_Q9
                            )

                    rem ======================================================================================================================
            rem ============== 2.7 menu_ten_goi_autoid_Q9 ====================================================================================
                :menu_ten_goi_autoid_Q9
                cls
                echo.
                echo.
                echo.
                echo ============================================================
                echo.
                echo.
                echo  1:  HIEN TAT CA PACKAGES NAME
                echo  2:  HIEN PACKAGES NAME HE THONG
                echo  3:  HIEN PACKAGES NAME NGUOI CUNG CAI DAT
                echo  4:  HIEN PACKAGES NAME UNG DUNG DANG MO
                echo  5:  HIEN PACKAGES NAME UNG DUNG DA DISABLE
                echo.
                echo  0:  QUAY LAI
                echo 00:  THOAT
                set /p menu_ten_goi_autoid_Q9=" VUI LONG NHAP LUA CHON CUA BAN :   "
                    if %menu_ten_goi_autoid_Q9%==1 (
                        cls
                        goto hien_tat_ca_packages_name_autoid_Q9
                    ) else if %menu_ten_goi_autoid_Q9%==2 (
                        cls
                        goto hien_packages_name_system_autoid_Q9
                    ) else if %menu_ten_goi_autoid_Q9%==3 (
                        cls
                        goto hien_packages_name_user_install_autoid_Q9
                    ) else if %menu_ten_goi_autoid_Q9%==4 (
                        cls
                        goto hien_packages_name_ung_dung_dang_mo_autoid_Q9
                    ) else if %menu_ten_goi_autoid_Q9%==5 (
                        cls
                        goto hien_packages_name_ung_dung_da_disable_autoid_Q9
                    ) else if %menu_ten_goi_autoid_Q9%==0 (
                        rem quay lại menu chính
                        cls
                        goto menu_autoid_Q9
                    ) else if %menu_ten_goi_autoid_Q9%==00 (
                        rem thoát
                        exit
                    ) else (
                        cls
                        echo.
                        echo.
                        echo                LUA CHON BAN NHAP VAO KHONG HOP LE
                        echo                        VUI LONG NHAP LAI !
                        goto menu_ten_goi_autoid_Q9
                    )

            rem ==============================================================================================================================
                rem ============== 2.7.1 hien_tat_ca_packages_name_autoid_Q9 =================================================================
                    :hien_tat_ca_packages_name_autoid_Q9
                    cls
                    echo.
                        adb shell pm list packages
                    echo.
                    echo ************************************************************
                    echo.
                    echo.
                    echo  1:  TIEP TUC
                    echo.
                    echo  0:  QUAY LAI
                    echo 00:  THOAT
                    set /p hien_tat_ca_packages_name_autoid_Q9=" VUI LONG NHAP LUA CHON CUA BAN :   "
                        if %hien_tat_ca_packages_name_autoid_Q9%==1 (
                            cls
                            goto hien_tat_ca_packages_name_autoid_Q9
                        ) else if %hien_tat_ca_packages_name_autoid_Q9%==0 (
                            cls
                            goto menu_ten_goi_autoid_Q9
                        ) else if  %hien_tat_ca_packages_name_autoid_Q9%==00 (
                            rem thoát
                            exit
                        ) else (
                            cls
                            echo.
                            echo.
                            echo                LUA CHON BAN NHAP VAO KHONG HOP LE
                            echo                        VUI LONG NHAP LAI !
                            goto hien_tat_ca_packages_name_autoid_Q9
                        )

                rem ==========================================================================================================================
                rem ============== 2.7.2 hien_packages_name_system_autoid_Q9 =================================================================
                    :hien_packages_name_system_autoid_Q9
                    cls
                    echo.
                        adb shell pm list packages -s
                    echo.
                    echo ************************************************************
                    echo.
                    echo.
                    echo  1:  TIEP TUC
                    echo.
                    echo  0:  QUAY LAI
                    echo 00:  THOAT
                    set /p hien_packages_name_system_autoid_Q9=" VUI LONG NHAP LUA CHON CUA BAN :   "
                        if %hien_packages_name_system_autoid_Q9%==1 (
                            cls
                            goto hien_packages_name_system_autoid_Q9
                        ) else if %hien_packages_name_system_autoid_Q9%==0 (
                            cls
                            goto menu_ten_goi_autoid_Q9
                        ) else if  %hien_packages_name_system_autoid_Q9%==00 (
                            rem thoát
                            exit
                        ) else (
                            cls
                            echo.
                            echo.
                            echo                LUA CHON BAN NHAP VAO KHONG HOP LE
                            echo                        VUI LONG NHAP LAI !
                            goto hien_packages_name_system_autoid_Q9
                        )
                        
                rem ==========================================================================================================================
                rem ============== 2.7.3 hien_packages_name_user_install_autoid_Q9 ===========================================================
                    :hien_packages_name_user_install_autoid_Q9
                    cls
                    echo.
                        adb shell pm list packages -3
                    echo.
                    echo ************************************************************
                    echo.
                    echo.
                    echo  1:  TIEP TUC
                    echo.
                    echo  0:  QUAY LAI
                    echo 00:  THOAT
                    set /p hien_packages_name_user_install_autoid_Q9=" VUI LONG NHAP LUA CHON CUA BAN :   "
                        if %hien_packages_name_user_install_autoid_Q9%==1 (
                            cls
                            goto hien_packages_name_user_install_autoid_Q9
                        ) else if %hien_packages_name_user_install_autoid_Q9%==0 (
                            cls
                            goto menu_ten_goi_autoid_Q9
                        ) else if  %hien_packages_name_user_install_autoid_Q9%==00 (
                            rem thoát
                            exit
                        ) else (
                            cls
                            echo.
                            echo.
                            echo                LUA CHON BAN NHAP VAO KHONG HOP LE
                            echo                        VUI LONG NHAP LAI !
                            goto hien_packages_name_user_install_autoid_Q9
                        )
                        
                rem ==========================================================================================================================
                rem ============== 2.7.4 hien_packages_name_ung_dung_dang_mo_autoid_Q9 =======================================================
                    :hien_packages_name_ung_dung_dang_mo_autoid_Q9
                    cls
                    echo.
                        adb shell dumpsys window | findstr mCurrentFocus
                    echo.
                    echo ************************************************************
                    echo.
                    echo.
                    echo  1:  TIEP TUC
                    echo.
                    echo  0:  QUAY LAI
                    echo 00:  THOAT
                    set /p hien_packages_name_ung_dung_dang_mo_autoid_Q9=" VUI LONG NHAP LUA CHON CUA BAN :   "
                        if %hien_packages_name_ung_dung_dang_mo_autoid_Q9%==1 (
                            cls
                            goto hien_packages_name_ung_dung_dang_mo_autoid_Q9
                        ) else if %hien_packages_name_ung_dung_dang_mo_autoid_Q9%==0 (
                            cls
                            goto menu_ten_goi_autoid_Q9
                        ) else if  %hien_packages_name_ung_dung_dang_mo_autoid_Q9%==00 (
                            rem thoát
                            exit
                        ) else (
                            cls
                            echo.
                            echo.
                            echo                LUA CHON BAN NHAP VAO KHONG HOP LE
                            echo                        VUI LONG NHAP LAI !
                            goto hien_packages_name_ung_dung_dang_mo_autoid_Q9
                        )
                        
                rem ==========================================================================================================================
                rem ============== 2.7.5 hien_packages_name_ung_dung_da_disable_autoid_Q9 ====================================================
                    :hien_packages_name_ung_dung_da_disable_autoid_Q9
                    cls
                    echo.
                        adb shell pm list packages -d
                    echo.
                    echo ************************************************************
                    echo.
                    echo.
                    echo  1:  TIEP TUC
                    echo.
                    echo  0:  QUAY LAI
                    echo 00:  THOAT
                    set /p hien_packages_name_ung_dung_da_disable_autoid_Q9=" VUI LONG NHAP LUA CHON CUA BAN :   "
                        if %hien_packages_name_ung_dung_da_disable_autoid_Q9%==1 (
                            cls
                            goto hien_packages_name_ung_dung_da_disable_autoid_Q9
                        ) else if %hien_packages_name_ung_dung_da_disable_autoid_Q9%==0 (
                            cls
                            goto menu_ten_goi_autoid_Q9
                        ) else if  %hien_packages_name_ung_dung_da_disable_autoid_Q9%==00 (
                            rem thoát
                            exit
                        ) else (
                            cls
                            echo.
                            echo.
                            echo                LUA CHON BAN NHAP VAO KHONG HOP LE
                            echo                        VUI LONG NHAP LAI !
                            goto hien_packages_name_ung_dung_da_disable_autoid_Q9
                        )
                        
                rem ==========================================================================================================================
            rem ============== 2.8 menu_pass_wifi_autoid_Q9 ==================================================================================
                :menu_pass_wifi_autoid_Q9
                cls
                echo.
                echo.
                echo.
                echo ============================================================
                echo.
                echo.
                echo  1:  NHAP PASSWORD WIFI J^&T Expreess Office
                echo  2:  NHAP PASSWORD WIFI J^&T Expreess Guest
                echo  3:  NHAP DU LIEU VAO MAN HINH
                echo.
                echo  0:  QUAY LAI
                echo 00:  THOAT
                set /p menu_pass_wifi_autoid_Q9=" VUI LONG NHAP LUA CHON CUA BAN :   "
                    if %menu_pass_wifi_autoid_Q9%==1 (
                        cls
                        goto wifi_JT_Expreess_Office_autoid_Q9
                    ) else if %menu_pass_wifi_autoid_Q9%==2 (
                        cls
                        goto wifi_JT_Expreess_Guest_autoid_Q9
                    ) else if %menu_pass_wifi_autoid_Q9%==3 (
                        cls
                        goto nhap_du_lieu_vao_man_hinh_autoid_Q9
                    ) else if %menu_pass_wifi_autoid_Q9%==0 (
                        cls
                        goto menu_autoid_Q9
                    ) else if %menu_pass_wifi_autoid_Q9%==00 (
                        rem thoát
                        exit
                    ) else (
                        cls
                        echo.
                        echo.
                        echo                LUA CHON BAN NHAP VAO KHONG HOP LE
                        echo                        VUI LONG NHAP LAI !
                        goto menu_pass_wifi_autoid_Q9
                    )

            rem ==============================================================================================================================
                rem ============== 2.8.1 wifi_JT_Expreess_Office_autoid_Q9 ===================================================================
                    :wifi_JT_Expreess_Office_autoid_Q9
                    cls
                        adb shell input text "%pass_wifi_jt_expreess_office%"
                    cls
                    echo %pass_wifi_jt_expreess_office%
                    echo ======================= HOAN THANH ! =======================
                    echo.
                    echo.
                    echo  1:  THUC HIEN LAI THAO TAC
                    echo.
                    echo  0:  QUAY LAI
                    echo 00:  THOAT
                    set /p wifi_JT_Expreess_Office_autoid_Q9=" VUI LONG NHAP LUA CHON CUA BAN :   "
                        if %wifi_JT_Expreess_Office_autoid_Q9%==1 (
                            cls
                            goto wifi_JT_Expreess_Office_autoid_Q9
                        ) else if %wifi_JT_Expreess_Office_autoid_Q9%==0 (
                            cls
                            goto menu_pass_wifi_autoid_Q9
                        ) else if %wifi_JT_Expreess_Office_autoid_Q9%==00 (
                            exit
                        ) else (
                            cls
                            echo.
                            echo.
                            echo                LUA CHON BAN NHAP VAO KHONG HOP LE
                            echo                        VUI LONG NHAP LAI !
                            goto wifi_JT_Expreess_Office_autoid_Q9
                        )

                rem ==========================================================================================================================
                rem ============== 2.8.2 wifi_JT_Expreess_Guest_autoid_Q9 ====================================================================
                    :wifi_JT_Expreess_Guest_autoid_Q9
                    cls
                        adb shell input text "%pass_wifi_JT_Expreess_Guest%"
                    cls
                    echo %pass_wifi_JT_Expreess_Guest%
                    echo ======================= HOAN THANH ! =======================
                    echo.
                    echo.
                    echo  1:  THUC HIEN LAI THAO TAC
                    echo.
                    echo  0:  QUAY LAI
                    echo 00:  THOAT
                    set /p wifi_JT_Expreess_Guest_autoid_Q9=" VUI LONG NHAP LUA CHON CUA BAN :   "
                        if %wifi_JT_Expreess_Guest_autoid_Q9%==1 (
                            cls
                            goto wifi_JT_Expreess_Guest_autoid_Q9
                        ) else if %wifi_JT_Expreess_Guest_autoid_Q9%==0 (
                            cls
                            goto menu_pass_wifi_autoid_Q9
                        ) else if %wifi_JT_Expreess_Guest_autoid_Q9%==00 (
                            exit
                        ) else (
                            cls
                            echo.
                            echo.
                            echo                LUA CHON BAN NHAP VAO KHONG HOP LE
                            echo                        VUI LONG NHAP LAI !
                            goto wifi_JT_Expreess_Office_autoid_Q9
                        )

                rem ==========================================================================================================================
                rem ============== 2.8.3 nhap_du_lieu_vao_man_hinh_autoid_Q9 =================================================================
                    :nhap_du_lieu_vao_man_hinh_autoid_Q9
                    cls
                    echo Vui long nhap noi dung ban muon nhap vao thiep bi
                    echo      * NHAP 'back' DE QUAY LAI
                    echo      * NHAP 'exit' DE THOAT
                    echo.
                    echo.
                    set /p nhap_du_lieu_vao_man_hinh_autoid_Q9="Nhap noi dung vao day:   "
                        if "%nhap_du_lieu_vao_man_hinh_autoid_Q9%"=="back" (
                            cls
                            goto menu_pass_wifi_autoid_Q9
                        ) else if "%nhap_du_lieu_vao_man_hinh_autoid_Q9%"=="exit" (
                            exit
                        ) else (
                                adb shell input text "%nhap_du_lieu_vao_man_hinh_autoid_Q9%"
                            if ERRORLEVEL 1 (
                                cls
                                echo LOI: Khong the thuc hien thao tac. Vui long kiem tra lai
                                goto nhap_du_lieu_vao_man_hinh_autoid_Q9
                            ) else (
                                cls
                                goto nhap_du_lieu_vao_man_hinh_autoid_Q9
                            )
                        )

                rem ==========================================================================================================================
            rem ==============================================================================================================================
            rem ============== 2.9 menu_restart_autoid_Q9 ==================================================================================
                :menu_restart_autoid_Q9
                echo.
                echo.
                echo.
                echo ============================================================
                echo.
                echo  1:  TIEP TUC
                echo.
                echo  0:  QUAY LAI
                echo 00:  THOAT
                set /p menu_restart_autoid_Q9=" VUI LONG NHAP LUA CHON CUA BAN :   "
                    if %menu_restart_autoid_Q9%==1 (
                        cls
                         adb reboot
                        cls
                        goto menu_restart_autoid_Q9
                    ) else if %menu_restart_autoid_Q9%==0 (
                        cls
                        goto menu_autoid_Q9
                    ) else if %menu_restart_autoid_Q9%==00 (
                        exit
                    ) else (
                        cls
                        echo.
                        echo.
                        echo                LUA CHON BAN NHAP VAO KHONG HOP LE
                        echo                        VUI LONG NHAP LAI !
                        goto menu_restart_autoid_Q9
                    )

            rem ==============================================================================================================================
            rem ============== 2.10 menu_auto_run_autoid_Q9 (*) ============================================================================
                :menu_auto_run_autoid_Q9
                cls
                echo Thuc hien tu dong SETUP tu dong thiep bi IDATA K1S
                 adb devices -l
                echo.
                echo ==================== Xac nhan thuc hien ====================
                echo Ban vui long bat che do nha phat trien - BAT go loi USB
                echo.
                echo - Nhung ung dung se duoc an
                echo    * Chrome
                echo    * Google Play
                echo    * Google Drive
                echo    * Email
                echo    * Duo
                echo    * Tro Ly
                echo    * Google
                echo    * Bo cong cu SIM
                echo    * Youtube
                echo    * YT Music
                echo    * Play Phim
                echo - Ung dung JT ban cu se duoc XOA
                echo - Tao thu muc apk_file
                echo - Copy file cai app JT moi vao thiep bi
                echo.
                echo ============================================================
                echo.
                echo  1:  XAC NHAN TIEP TUC THAO TAC
                echo.
                echo  0:  QUAY LAI
                echo 00:  THOAT
                set /p menu_auto_run_autoid_Q9=" VUI LONG NHAP LUA CHON CUA BAN :   "
                    if %menu_auto_run_autoid_Q9%==1 (
                        cls
                        goto start_run_autoid_Q9
                    ) else if %menu_auto_run_autoid_Q9%==0 (
                        cls
                        goto menu_autoid_Q9
                    ) else if %menu_auto_run_autoid_Q9%==00 (
                        exit
                    ) else (
                        cls
                        echo.
                        echo.
                        echo                LUA CHON BAN NHAP VAO KHONG HOP LE
                        echo                        VUI LONG NHAP LAI !
                        goto menu_auto_run_autoid_Q9
                    )

            rem ==============================================================================================================================
                        rem ============== start_run_autoid_Q9 ===============================================================================
                            :start_run_autoid_Q9
                            echo Bat dau thuc thi
                             adb devices -l
                             adb get-serialno
                            rem bật wifi
                             adb shell svc wifi enable
                            rem bật giây trên thanh thông báo
                             adb shell settings put secure clock_seconds 1
                            rem xóa app JT cũ
                             adb uninstall "%packages_name_JT_cu_autoid_Q9%"
                            rem cài app JT bản mới nhất
                             adb install -r "%duong_dan_app_ban_moi%"
                                rem adb install -r "%duong_dan_app_ban_cu%" dùng khi bản mới lỗi
                            rem ẩn ứng dụng
                             adb shell pm disable-user com.android.chrome
                             adb shell pm disable-user com.android.vending
                             adb shell pm disable-user com.google.android.apps.docs
                             adb shell pm disable-user com.google.android.gm
                             adb shell pm disable-user com.google.android.apps.googleassistant
                             adb shell pm disable-user com.google.android.gms
                             adb shell pm disable-user com.android.stk
                             adb shell pm disable-user com.google.android.apps.youtube.music
                             adb shell pm disable-user com.google.android.videos
                             adb shell pm disable-user com.google.android.youtube
                             adb shell pm disable-user com.android.cellbroadcastreceiver
                             adb shell pm disable-user com.google.android.apps.tachyon
                             adb shell pm disable-user com.google.android.googlequicksearchbox
                             adb shell pm disable-user com.google.android.apps.maps
                            rem xóa ứng dụng không cần thiết
                             adb shell pm uninstall -k --user 0 com.android.chrome
                             adb shell pm uninstall -k --user 0 com.android.vending
                             adb shell pm uninstall -k --user 0 com.google.android.gms
                            rem tạo thư mục apk_file trong máy
                             adb shell mkdir /storage/emulated/0/apk_file
                            rem copy file từ máy tính sang thiếp bị
                             adb push "%duong_dan_app_ban_moi%" /storage/emulated/0/apk_file
                            goto menu_auto_run_autoid_Q9

                        rem ==================================================================================================================
            rem ==============================================================================================================================
        rem ==================================================================================================================================
rem ==========================================================================================================================================
rem ============== limit_off =================================================================================================================
    :limit_off
    color 02
    echo DA BAT CHE DO NANG CAO
    echo    * nhap vao lenh "cls" de xoa man hinh
    echo    * nhap "home" de ve menu chinh
    echo    * nhap "exit" de thoat
    set /p limit_off="  "
        if "%limit_off%"=="home" (
            cls
            color 0F
            goto mainmenu
        ) else if "%limit_off%"=="exit" (
            exit
        ) else (
            %limit_off%
            goto limit_off
        )
rem ==========================================================================================================================================


:end
adb kill-server
pause
                    rem CHỨA GHI CHÚ****************************************************
                        rem ============================================================
                        rem ======================= HOAN THANH ! =======================
                        rem ************************************************************
                        rem *********************** LUU Y !!!!!! ***********************
                        rem ==================== Xac nhan thuc hien ====================
                    rem ****************************************************************