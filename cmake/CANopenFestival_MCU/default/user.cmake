include_directories(
    ${CMAKE_CURRENT_SOURCE_DIR}/../../../CANopenFestival.mcc
    ${CMAKE_CURRENT_SOURCE_DIR}/../../../CANopenFestival.mcc/mcc_generated_files/dee
    ${CMAKE_CURRENT_SOURCE_DIR}/../../../CANopenFestival.mcc/mcc_generated_files/system
    ${CMAKE_CURRENT_SOURCE_DIR}/../../../CANopenFestival.mcc/mcc_generated_files/timer
    ${CMAKE_CURRENT_SOURCE_DIR}/../../../CANopenFestival.mcc/driver
    ${CMAKE_CURRENT_SOURCE_DIR}/../../../Mongo_CanFestival/inc
    ${CMAKE_CURRENT_SOURCE_DIR}/../../../Mongo_CanFestival/inc/MCU
    ${CMAKE_CURRENT_SOURCE_DIR}/../../../Mongo_CanFestival/dictionary
    ${CMAKE_CURRENT_SOURCE_DIR}/../../../Mongo_CanFestival/hardware
)
add_subdirectory(
"${CMAKE_CURRENT_SOURCE_DIR}/../../../Mongo_CanFestival"
"${CMAKE_BINARY_DIR}/Mongo_CanFestival"
)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON) # 生成 compile_commands.json，方便 VSCode 等工具使用
