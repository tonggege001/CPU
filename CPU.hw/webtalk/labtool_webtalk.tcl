webtalk_init -webtalk_dir D:/ARCHIVE/CPU/CPU.hw/webtalk/
webtalk_register_client -client project
webtalk_add_data -client project -key date_generated -value "Sat Feb 23 09:53:32 2019" -context "software_version_and_target_device"
webtalk_add_data -client project -key product_version -value "Vivado v2015.2 (64-bit)" -context "software_version_and_target_device"
webtalk_add_data -client project -key build_version -value "1266856" -context "software_version_and_target_device"
webtalk_add_data -client project -key os_platform -value "WIN64" -context "software_version_and_target_device"
webtalk_add_data -client project -key registration_id -value "" -context "software_version_and_target_device"
webtalk_add_data -client project -key tool_flow -value "labtool" -context "software_version_and_target_device"
webtalk_add_data -client project -key beta -value "FALSE" -context "software_version_and_target_device"
webtalk_add_data -client project -key route_design -value "FALSE" -context "software_version_and_target_device"
webtalk_add_data -client project -key target_family -value "not_applicable" -context "software_version_and_target_device"
webtalk_add_data -client project -key target_device -value "not_applicable" -context "software_version_and_target_device"
webtalk_add_data -client project -key target_package -value "not_applicable" -context "software_version_and_target_device"
webtalk_add_data -client project -key target_speed -value "not_applicable" -context "software_version_and_target_device"
webtalk_add_data -client project -key random_id -value "9ba45a0d-c2a5-4d7d-a5a3-6d9d8a349182" -context "software_version_and_target_device"
webtalk_add_data -client project -key project_id -value "14056ea4-d7bf-4887-9dd5-bb729d37a8cc" -context "software_version_and_target_device"
webtalk_add_data -client project -key project_iteration -value "9" -context "software_version_and_target_device"
webtalk_add_data -client project -key os_name -value "Microsoft Windows 8 or later , 64-bit" -context "user_environment"
webtalk_add_data -client project -key os_release -value "major release  (build 9200)" -context "user_environment"
webtalk_add_data -client project -key cpu_name -value "Intel(R) Core(TM) i5-6200U CPU @ 2.30GHz" -context "user_environment"
webtalk_add_data -client project -key cpu_speed -value "2400 MHz" -context "user_environment"
webtalk_add_data -client project -key total_processors -value "1" -context "user_environment"
webtalk_add_data -client project -key system_ram -value "4.000 GB" -context "user_environment"
webtalk_register_client -client labtool
webtalk_add_data -client labtool -key cable -value "Digilent/Nexys4DDR/15000000" -context "labtool\\usage"
webtalk_add_data -client labtool -key chain -value "13631093" -context "labtool\\usage"
webtalk_add_data -client labtool -key pgmcnt -value "02:00:00" -context "labtool\\usage"
webtalk_transmit -clientid 2996456805 -regid "" -xml D:/ARCHIVE/CPU/CPU.hw/webtalk/usage_statistics_ext_labtool.xml -html D:/ARCHIVE/CPU/CPU.hw/webtalk/usage_statistics_ext_labtool.html -wdm D:/ARCHIVE/CPU/CPU.hw/webtalk/usage_statistics_ext_labtool.wdm -intro "<H3>LABTOOL Usage Report</H3><BR>"
webtalk_terminate
