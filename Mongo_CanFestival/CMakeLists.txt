# 使用 file(GLOB ...) 收集源文件（注意：GLOB 不推荐用于生产，但调试可用）
file(GLOB Mongo_CanFestival_SOURCES
    ${CMAKE_CURRENT_SOURCE_DIR}/src/*.c
)

# 创建静态库
add_library(Mongo_CanFestival STATIC ${Mongo_CanFestival_SOURCES})

# 包含目录（注意：第一个参数是目标名 Mongo_CanFestival）
target_include_directories(Mongo_CanFestival PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}/hardware
    ${CMAKE_CURRENT_SOURCE_DIR}/inc
    ${CMAKE_CURRENT_SOURCE_DIR}/inc/MCU
    ${CMAKE_CURRENT_SOURCE_DIR}/dictionary
)