# The following variables contains the files used by the different stages of the build process.
set(CANopenFestival_MCU_default_default_XC16_FILE_TYPE_assemble
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../CANopenFestival.mcc/mcc_generated_files/flash/src/flash_asm.s"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../CANopenFestival.mcc/mcc_generated_files/system/src/dmt_asm.s"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../CANopenFestival.mcc/mcc_generated_files/system/src/where_was_i.s")
set_source_files_properties(${CANopenFestival_MCU_default_default_XC16_FILE_TYPE_assemble} PROPERTIES LANGUAGE ASM)

# For assembly files, add "." to the include path for each file so that .include with a relative path works
foreach(source_file ${CANopenFestival_MCU_default_default_XC16_FILE_TYPE_assemble})
        set_source_files_properties(${source_file} PROPERTIES INCLUDE_DIRECTORIES "$<PATH:NORMAL_PATH,$<PATH:REMOVE_FILENAME,${source_file}>>")
endforeach()

set(CANopenFestival_MCU_default_default_XC16_FILE_TYPE_assemblePreproc)
set_source_files_properties(${CANopenFestival_MCU_default_default_XC16_FILE_TYPE_assemblePreproc} PROPERTIES LANGUAGE ASM)

# For assembly files, add "." to the include path for each file so that .include with a relative path works
foreach(source_file ${CANopenFestival_MCU_default_default_XC16_FILE_TYPE_assemblePreproc})
        set_source_files_properties(${source_file} PROPERTIES INCLUDE_DIRECTORIES "$<PATH:NORMAL_PATH,$<PATH:REMOVE_FILENAME,${source_file}>>")
endforeach()

set(CANopenFestival_MCU_default_default_XC16_FILE_TYPE_compile
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../CANopenFestival.mcc/dictionary/Master.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../CANopenFestival.mcc/hardware/canmcu.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../CANopenFestival.mcc/main.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../CANopenFestival.mcc/mcc_generated_files/can/src/can1.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../CANopenFestival.mcc/mcc_generated_files/dee/src/dee.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../CANopenFestival.mcc/mcc_generated_files/flash/src/flash.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../CANopenFestival.mcc/mcc_generated_files/spi_host/src/spi1.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../CANopenFestival.mcc/mcc_generated_files/system/src/clock.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../CANopenFestival.mcc/mcc_generated_files/system/src/config_bits.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../CANopenFestival.mcc/mcc_generated_files/system/src/dmt.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../CANopenFestival.mcc/mcc_generated_files/system/src/interrupt.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../CANopenFestival.mcc/mcc_generated_files/system/src/pins.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../CANopenFestival.mcc/mcc_generated_files/system/src/reset.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../CANopenFestival.mcc/mcc_generated_files/system/src/system.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../CANopenFestival.mcc/mcc_generated_files/system/src/traps.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../CANopenFestival.mcc/mcc_generated_files/timer/src/delay.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../CANopenFestival.mcc/mcc_generated_files/timer/src/sccp1.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../CANopenFestival.mcc/src/dcf.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../CANopenFestival.mcc/src/emcy.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../CANopenFestival.mcc/src/lifegrd.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../CANopenFestival.mcc/src/lss.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../CANopenFestival.mcc/src/nmtMaster.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../CANopenFestival.mcc/src/nmtSlave.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../CANopenFestival.mcc/src/objacces.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../CANopenFestival.mcc/src/pdo.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../CANopenFestival.mcc/src/sdo.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../CANopenFestival.mcc/src/states.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../CANopenFestival.mcc/src/sync.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../CANopenFestival.mcc/src/timer.c")
set_source_files_properties(${CANopenFestival_MCU_default_default_XC16_FILE_TYPE_compile} PROPERTIES LANGUAGE C)
set(CANopenFestival_MCU_default_default_XC16_FILE_TYPE_link)
set(CANopenFestival_MCU_default_default_XC16_FILE_TYPE_bin2hex)
set(CANopenFestival_MCU_default_image_name "default.elf")
set(CANopenFestival_MCU_default_image_base_name "default")

# The output directory of the final image.
set(CANopenFestival_MCU_default_output_dir "${CMAKE_CURRENT_SOURCE_DIR}/../../../out/CANopenFestival_MCU")

# The full path to the final image.
set(CANopenFestival_MCU_default_full_path_to_image ${CANopenFestival_MCU_default_output_dir}/${CANopenFestival_MCU_default_image_name})
