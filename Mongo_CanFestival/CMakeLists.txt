file(GLOB Mongo_CanFestival_SOURCES
    ${CMAKE_CURRENT_SOURCE_DIR}/src/*.c
)

add_library(Mongo_CanFestival STATIC ${Mongo_CanFestival_SOURCES})

target_compile_options(Mongo_CanFestival PRIVATE
    -mcpu=33CK256MP502
)

target_include_directories(Mongo_CanFestival PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}/hardware
    ${CMAKE_CURRENT_SOURCE_DIR}/inc
    ${CMAKE_CURRENT_SOURCE_DIR}/inc/MCU
    ${CMAKE_CURRENT_SOURCE_DIR}/dictionary
)