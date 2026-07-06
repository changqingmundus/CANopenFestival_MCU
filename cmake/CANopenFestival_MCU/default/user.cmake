include_directories(
    "${CMAKE_SOURCE_DIR}/CANopenFestival.mcc"
    "${CMAKE_SOURCE_DIR}/CANopenFestival.mcc/mcc_generated_files"
    "${CMAKE_SOURCE_DIR}/CANopenFestival.mcc/driver"
)


set(CMAKE_EXPORT_COMPILE_COMMANDS ON) # 生成 compile_commands.json，方便 VSCode 等工具使用
