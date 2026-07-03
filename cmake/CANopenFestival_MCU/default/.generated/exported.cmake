set(DEPENDENT_MP_BIN2HEXCANopenFestival_MCU_default_qNDzaU8w "d:/Microchip/xc16/bin/xc16-bin2hex.exe")
set(DEPENDENT_DEPENDENT_TARGET_ELFCANopenFestival_MCU_default_qNDzaU8w "${CMAKE_CURRENT_LIST_DIR}/../../../../out/CANopenFestival_MCU/default.elf")
set(DEPENDENT_TARGET_DIRCANopenFestival_MCU_default_qNDzaU8w "${CMAKE_CURRENT_LIST_DIR}/../../../../out/CANopenFestival_MCU")
set(DEPENDENT_BYPRODUCTSCANopenFestival_MCU_default_qNDzaU8w ${DEPENDENT_TARGET_DIRCANopenFestival_MCU_default_qNDzaU8w}/${sourceFileNameCANopenFestival_MCU_default_qNDzaU8w}.s)
add_custom_command(
    OUTPUT ${DEPENDENT_TARGET_DIRCANopenFestival_MCU_default_qNDzaU8w}/${sourceFileNameCANopenFestival_MCU_default_qNDzaU8w}.s
    COMMAND ${DEPENDENT_MP_BIN2HEXCANopenFestival_MCU_default_qNDzaU8w} ${DEPENDENT_DEPENDENT_TARGET_ELFCANopenFestival_MCU_default_qNDzaU8w} --image ${sourceFileNameCANopenFestival_MCU_default_qNDzaU8w} ${addressCANopenFestival_MCU_default_qNDzaU8w} ${modeCANopenFestival_MCU_default_qNDzaU8w} -mdfp=C:/Users/wsh/.mchp_packs/Microchip/dsPIC33CK-MP_DFP/1.15.423/xc16 
    WORKING_DIRECTORY ${DEPENDENT_TARGET_DIRCANopenFestival_MCU_default_qNDzaU8w}
    DEPENDS ${DEPENDENT_DEPENDENT_TARGET_ELFCANopenFestival_MCU_default_qNDzaU8w})
add_custom_target(
    dependent_produced_source_artifactCANopenFestival_MCU_default_qNDzaU8w 
    DEPENDS ${DEPENDENT_TARGET_DIRCANopenFestival_MCU_default_qNDzaU8w}/${sourceFileNameCANopenFestival_MCU_default_qNDzaU8w}.s
    )
