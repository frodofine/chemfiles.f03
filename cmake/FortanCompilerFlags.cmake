include(CheckFortranCompilerFlag)

macro(set_fortran_debug_flag_if_possible _flag_)
    CHECK_Fortran_COMPILER_FLAG("${_flag_}" FC_SUPPORTS${_flag_})
    if(FC_SUPPORTS${_flag_})
        set(CMAKE_Fortran_FLAGS_DEBUG "${CMAKE_Fortran_FLAGS_DEBUG} ${_flag_}")
    endif()
endmacro()

# gfortran
set_fortran_debug_flag_if_possible("-Wall")
set_fortran_debug_flag_if_possible("-Wextra")
set_fortran_debug_flag_if_possible("-Wimplicit-interface")
set_fortran_debug_flag_if_possible("-Wimplicit-procedure")
set_fortran_debug_flag_if_possible("-Wno-c-binding-type")

# intel ifort
set_fortran_debug_flag_if_possible("-warn all")

if(CMAKE_Fortran_COMPILER_ID MATCHES "GNU")
    set(CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS} -std=f2008 -pedantic")
    set(CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS} -ffree-form")
    set(CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS} -ffree-line-length-none")
elseif(CMAKE_Fortran_COMPILER_ID MATCHES "Intel")
    set(CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS} -stand f08 -warn stderrors")
    set(CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS} -free")
    set(CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS} -diag-disable 5268")
elseif(CMAKE_Fortran_COMPILER_ID MATCHES "PGI")
    set(CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS} -Mstandard -Mallocatable=03")
    set(CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS} -Mfree")
endif()

# include(CheckFortranSourceCompiles)
# check_fortran_source_compiles("program foo\nend program")
