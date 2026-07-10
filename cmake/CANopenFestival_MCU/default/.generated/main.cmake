include("${CMAKE_CURRENT_LIST_DIR}/rule.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/file.cmake")

set(CANopenFestival_MCU_default_library_list )

# Handle files with suffix s, for group default-XC16
if(CANopenFestival_MCU_default_default_XC16_FILE_TYPE_assemble)
add_library(CANopenFestival_MCU_default_default_XC16_assemble OBJECT ${CANopenFestival_MCU_default_default_XC16_FILE_TYPE_assemble})
    CANopenFestival_MCU_default_default_XC16_assemble_rule(CANopenFestival_MCU_default_default_XC16_assemble)
    list(APPEND CANopenFestival_MCU_default_library_list "$<TARGET_OBJECTS:CANopenFestival_MCU_default_default_XC16_assemble>")

endif()

# Handle files with suffix S, for group default-XC16
if(CANopenFestival_MCU_default_default_XC16_FILE_TYPE_assemblePreproc)
add_library(CANopenFestival_MCU_default_default_XC16_assemblePreproc OBJECT ${CANopenFestival_MCU_default_default_XC16_FILE_TYPE_assemblePreproc})
    CANopenFestival_MCU_default_default_XC16_assemblePreproc_rule(CANopenFestival_MCU_default_default_XC16_assemblePreproc)
    list(APPEND CANopenFestival_MCU_default_library_list "$<TARGET_OBJECTS:CANopenFestival_MCU_default_default_XC16_assemblePreproc>")

endif()

# Handle files with suffix c, for group default-XC16
if(CANopenFestival_MCU_default_default_XC16_FILE_TYPE_compile)
add_library(CANopenFestival_MCU_default_default_XC16_compile OBJECT ${CANopenFestival_MCU_default_default_XC16_FILE_TYPE_compile})
    CANopenFestival_MCU_default_default_XC16_compile_rule(CANopenFestival_MCU_default_default_XC16_compile)
    list(APPEND CANopenFestival_MCU_default_library_list "$<TARGET_OBJECTS:CANopenFestival_MCU_default_default_XC16_compile>")

endif()

# Handle files with suffix s, for group default-XC16
if(CANopenFestival_MCU_default_default_XC16_FILE_TYPE_dependentObject)
add_library(CANopenFestival_MCU_default_default_XC16_dependentObject OBJECT ${CANopenFestival_MCU_default_default_XC16_FILE_TYPE_dependentObject})
    CANopenFestival_MCU_default_default_XC16_dependentObject_rule(CANopenFestival_MCU_default_default_XC16_dependentObject)
    list(APPEND CANopenFestival_MCU_default_library_list "$<TARGET_OBJECTS:CANopenFestival_MCU_default_default_XC16_dependentObject>")

endif()

# Handle files with suffix elf, for group default-XC16
if(CANopenFestival_MCU_default_default_XC16_FILE_TYPE_bin2hex)
add_library(CANopenFestival_MCU_default_default_XC16_bin2hex OBJECT ${CANopenFestival_MCU_default_default_XC16_FILE_TYPE_bin2hex})
    CANopenFestival_MCU_default_default_XC16_bin2hex_rule(CANopenFestival_MCU_default_default_XC16_bin2hex)
    list(APPEND CANopenFestival_MCU_default_library_list "$<TARGET_OBJECTS:CANopenFestival_MCU_default_default_XC16_bin2hex>")

endif()


# Main target for this project
add_executable(CANopenFestival_MCU_default_image_hUGsFjIX ${CANopenFestival_MCU_default_library_list})

set_target_properties(CANopenFestival_MCU_default_image_hUGsFjIX PROPERTIES
    OUTPUT_NAME "default"
    SUFFIX ".elf"
    RUNTIME_OUTPUT_DIRECTORY "${CANopenFestival_MCU_default_output_dir}")
target_link_libraries(CANopenFestival_MCU_default_image_hUGsFjIX PRIVATE ${CANopenFestival_MCU_default_default_XC16_FILE_TYPE_link})

# Add the link options from the rule file.
CANopenFestival_MCU_default_link_rule( CANopenFestival_MCU_default_image_hUGsFjIX)

# Call bin2hex function from the rule file
CANopenFestival_MCU_default_bin2hex_rule(CANopenFestival_MCU_default_image_hUGsFjIX)

