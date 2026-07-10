set(DEPENDENT_MP_BIN2HEXCANopenFestival_MCU_default_hUGsFjIX "d:/Microchip/xc16/bin/xc16-bin2hex.exe")
set(DEPENDENT_DEPENDENT_TARGET_ELFCANopenFestival_MCU_default_hUGsFjIX "${CMAKE_CURRENT_LIST_DIR}/../../../../out/CANopenFestival_MCU/default.elf")
set(DEPENDENT_TARGET_DIRCANopenFestival_MCU_default_hUGsFjIX "${CMAKE_CURRENT_LIST_DIR}/../../../../out/CANopenFestival_MCU")
set(DEPENDENT_BYPRODUCTSCANopenFestival_MCU_default_hUGsFjIX ${DEPENDENT_TARGET_DIRCANopenFestival_MCU_default_hUGsFjIX}/${sourceFileNameCANopenFestival_MCU_default_hUGsFjIX}.s)
add_custom_command(
    OUTPUT ${DEPENDENT_TARGET_DIRCANopenFestival_MCU_default_hUGsFjIX}/${sourceFileNameCANopenFestival_MCU_default_hUGsFjIX}.s
    COMMAND ${DEPENDENT_MP_BIN2HEXCANopenFestival_MCU_default_hUGsFjIX} ${DEPENDENT_DEPENDENT_TARGET_ELFCANopenFestival_MCU_default_hUGsFjIX} --image ${sourceFileNameCANopenFestival_MCU_default_hUGsFjIX} ${addressCANopenFestival_MCU_default_hUGsFjIX} ${modeCANopenFestival_MCU_default_hUGsFjIX} -mdfp=C:/Users/ChangqingMundus/.mchp_packs/Microchip/dsPIC33CK-MP_DFP/1.15.423/xc16 
    WORKING_DIRECTORY ${DEPENDENT_TARGET_DIRCANopenFestival_MCU_default_hUGsFjIX}
    DEPENDS ${DEPENDENT_DEPENDENT_TARGET_ELFCANopenFestival_MCU_default_hUGsFjIX})
add_custom_target(
    dependent_produced_source_artifactCANopenFestival_MCU_default_hUGsFjIX 
    DEPENDS ${DEPENDENT_TARGET_DIRCANopenFestival_MCU_default_hUGsFjIX}/${sourceFileNameCANopenFestival_MCU_default_hUGsFjIX}.s
    )
