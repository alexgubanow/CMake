# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.


function(cmake_determine_compiler_support lang)

  if("x${lang}" STREQUAL "xC" AND COMMAND cmake_record_c_compile_features)
    message(CHECK_START "Detecting ${lang} compile features")

    set(CMAKE_C90_COMPILE_FEATURES)
    set(CMAKE_C99_COMPILE_FEATURES)
    set(CMAKE_C11_COMPILE_FEATURES)
    set(CMAKE_C17_COMPILE_FEATURES)
    set(CMAKE_C23_COMPILE_FEATURES)

    include("${CMAKE_ROOT}/Modules/Internal/FeatureTesting.cmake")

    cmake_record_c_compile_features()

    if(NOT _result EQUAL 0)
      message(CHECK_FAIL "failed")
      return()
    endif()

    if (CMAKE_C17_COMPILE_FEATURES AND CMAKE_C23_COMPILE_FEATURES)
      list(REMOVE_ITEM CMAKE_C23_COMPILE_FEATURES ${CMAKE_C17_COMPILE_FEATURES})
    endif()
    if (CMAKE_C11_COMPILE_FEATURES AND CMAKE_C17_COMPILE_FEATURES)
      list(REMOVE_ITEM CMAKE_C17_COMPILE_FEATURES ${CMAKE_C11_COMPILE_FEATURES})
    endif()
    if (CMAKE_C99_COMPILE_FEATURES AND CMAKE_C11_COMPILE_FEATURES)
      list(REMOVE_ITEM CMAKE_C11_COMPILE_FEATURES ${CMAKE_C99_COMPILE_FEATURES})
    endif()
    if (CMAKE_C90_COMPILE_FEATURES AND CMAKE_C99_COMPILE_FEATURES)
      list(REMOVE_ITEM CMAKE_C99_COMPILE_FEATURES ${CMAKE_C90_COMPILE_FEATURES})
    endif()

    if(NOT CMAKE_C_COMPILE_FEATURES)
      set(CMAKE_C_COMPILE_FEATURES
        ${CMAKE_C90_COMPILE_FEATURES}
        ${CMAKE_C99_COMPILE_FEATURES}
        ${CMAKE_C11_COMPILE_FEATURES}
        ${CMAKE_C17_COMPILE_FEATURES}
        ${CMAKE_C23_COMPILE_FEATURES}
      )
    endif()

    set(CMAKE_C_COMPILE_FEATURES ${CMAKE_C_COMPILE_FEATURES} PARENT_SCOPE)
    set(CMAKE_C90_COMPILE_FEATURES ${CMAKE_C90_COMPILE_FEATURES} PARENT_SCOPE)
    set(CMAKE_C99_COMPILE_FEATURES ${CMAKE_C99_COMPILE_FEATURES} PARENT_SCOPE)
    set(CMAKE_C11_COMPILE_FEATURES ${CMAKE_C11_COMPILE_FEATURES} PARENT_SCOPE)
    set(CMAKE_C17_COMPILE_FEATURES ${CMAKE_C17_COMPILE_FEATURES} PARENT_SCOPE)
    set(CMAKE_C23_COMPILE_FEATURES ${CMAKE_C23_COMPILE_FEATURES} PARENT_SCOPE)

    message(CHECK_PASS "done")

  elseif("x${lang}" STREQUAL "xCXX" AND COMMAND cmake_record_cxx_compile_features)
    message(CHECK_START "Detecting ${lang} compile features")

    set(CMAKE_CXX98_COMPILE_FEATURES)
    set(CMAKE_CXX11_COMPILE_FEATURES)
    set(CMAKE_CXX14_COMPILE_FEATURES)
    set(CMAKE_CXX17_COMPILE_FEATURES)
    set(CMAKE_CXX20_COMPILE_FEATURES)
    set(CMAKE_CXX23_COMPILE_FEATURES)
    set(CMAKE_CXX26_COMPILE_FEATURES)

    include("${CMAKE_ROOT}/Modules/Internal/FeatureTesting.cmake")

    cmake_record_cxx_compile_features()

    if(NOT _result EQUAL 0)
      message(CHECK_FAIL "failed")
      return()
    endif()

    if (CMAKE_CXX23_COMPILE_FEATURES AND CMAKE_CXX26_COMPILE_FEATURES)
      list(REMOVE_ITEM CMAKE_CXX26_COMPILE_FEATURES ${CMAKE_CXX23_COMPILE_FEATURES})
    endif()
    if (CMAKE_CXX20_COMPILE_FEATURES AND CMAKE_CXX23_COMPILE_FEATURES)
      list(REMOVE_ITEM CMAKE_CXX23_COMPILE_FEATURES ${CMAKE_CXX20_COMPILE_FEATURES})
    endif()
    if (CMAKE_CXX17_COMPILE_FEATURES AND CMAKE_CXX20_COMPILE_FEATURES)
      list(REMOVE_ITEM CMAKE_CXX20_COMPILE_FEATURES ${CMAKE_CXX17_COMPILE_FEATURES})
    endif()
    if (CMAKE_CXX14_COMPILE_FEATURES AND CMAKE_CXX17_COMPILE_FEATURES)
      list(REMOVE_ITEM CMAKE_CXX17_COMPILE_FEATURES ${CMAKE_CXX14_COMPILE_FEATURES})
    endif()
    if (CMAKE_CXX11_COMPILE_FEATURES AND CMAKE_CXX14_COMPILE_FEATURES)
      list(REMOVE_ITEM CMAKE_CXX14_COMPILE_FEATURES ${CMAKE_CXX11_COMPILE_FEATURES})
    endif()
    if (CMAKE_CXX98_COMPILE_FEATURES AND CMAKE_CXX11_COMPILE_FEATURES)
      list(REMOVE_ITEM CMAKE_CXX11_COMPILE_FEATURES ${CMAKE_CXX98_COMPILE_FEATURES})
    endif()

    if(NOT CMAKE_CXX_COMPILE_FEATURES)
      set(CMAKE_CXX_COMPILE_FEATURES
        ${CMAKE_CXX98_COMPILE_FEATURES}
        ${CMAKE_CXX11_COMPILE_FEATURES}
        ${CMAKE_CXX14_COMPILE_FEATURES}
        ${CMAKE_CXX17_COMPILE_FEATURES}
        ${CMAKE_CXX20_COMPILE_FEATURES}
        ${CMAKE_CXX23_COMPILE_FEATURES}
        ${CMAKE_CXX26_COMPILE_FEATURES}
      )
    endif()

    set(CMAKE_CXX_COMPILE_FEATURES ${CMAKE_CXX_COMPILE_FEATURES} PARENT_SCOPE)
    set(CMAKE_CXX98_COMPILE_FEATURES ${CMAKE_CXX98_COMPILE_FEATURES} PARENT_SCOPE)
    set(CMAKE_CXX11_COMPILE_FEATURES ${CMAKE_CXX11_COMPILE_FEATURES} PARENT_SCOPE)
    set(CMAKE_CXX14_COMPILE_FEATURES ${CMAKE_CXX14_COMPILE_FEATURES} PARENT_SCOPE)
    set(CMAKE_CXX17_COMPILE_FEATURES ${CMAKE_CXX17_COMPILE_FEATURES} PARENT_SCOPE)
    set(CMAKE_CXX20_COMPILE_FEATURES ${CMAKE_CXX20_COMPILE_FEATURES} PARENT_SCOPE)
    set(CMAKE_CXX23_COMPILE_FEATURES ${CMAKE_CXX23_COMPILE_FEATURES} PARENT_SCOPE)
    set(CMAKE_CXX26_COMPILE_FEATURES ${CMAKE_CXX26_COMPILE_FEATURES} PARENT_SCOPE)

    message(CHECK_PASS "done")

  elseif("x${lang}" STREQUAL "xCUDA" AND COMMAND cmake_record_cuda_compile_features)
    message(CHECK_START "Detecting ${lang} compile features")

    set(CMAKE_CUDA03_COMPILE_FEATURES)
    set(CMAKE_CUDA11_COMPILE_FEATURES)
    set(CMAKE_CUDA14_COMPILE_FEATURES)
    set(CMAKE_CUDA17_COMPILE_FEATURES)
    set(CMAKE_CUDA20_COMPILE_FEATURES)
    set(CMAKE_CUDA23_COMPILE_FEATURES)
    set(CMAKE_CUDA26_COMPILE_FEATURES)

    include("${CMAKE_ROOT}/Modules/Internal/FeatureTesting.cmake")

    cmake_record_cuda_compile_features()

    if(NOT _result EQUAL 0)
      message(CHECK_FAIL "failed")
      return()
    endif()

    if (CMAKE_CUDA23_COMPILE_FEATURES AND CMAKE_CUDA26_COMPILE_FEATURES)
      list(REMOVE_ITEM CMAKE_CUDA26_COMPILE_FEATURES ${CMAKE_CUDA23_COMPILE_FEATURES})
    endif()
    if (CMAKE_CUDA20_COMPILE_FEATURES AND CMAKE_CUDA23_COMPILE_FEATURES)
      list(REMOVE_ITEM CMAKE_CUDA23_COMPILE_FEATURES ${CMAKE_CUDA20_COMPILE_FEATURES})
    endif()
    if (CMAKE_CUDA17_COMPILE_FEATURES AND CMAKE_CUDA20_COMPILE_FEATURES)
      list(REMOVE_ITEM CMAKE_CUDA20_COMPILE_FEATURES ${CMAKE_CUDA17_COMPILE_FEATURES})
    endif()
    if (CMAKE_CUDA14_COMPILE_FEATURES AND CMAKE_CUDA17_COMPILE_FEATURES)
      list(REMOVE_ITEM CMAKE_CUDA17_COMPILE_FEATURES ${CMAKE_CUDA14_COMPILE_FEATURES})
    endif()
    if (CMAKE_CUDA11_COMPILE_FEATURES AND CMAKE_CUDA14_COMPILE_FEATURES)
      list(REMOVE_ITEM CMAKE_CUDA14_COMPILE_FEATURES ${CMAKE_CUDA11_COMPILE_FEATURES})
    endif()
    if (CMAKE_CUDA03_COMPILE_FEATURES AND CMAKE_CUDA11_COMPILE_FEATURES)
      list(REMOVE_ITEM CMAKE_CUDA11_COMPILE_FEATURES ${CMAKE_CUDA03_COMPILE_FEATURES})
    endif()

    if(NOT CMAKE_CUDA_COMPILE_FEATURES)
      set(CMAKE_CUDA_COMPILE_FEATURES
        ${CMAKE_CUDA03_COMPILE_FEATURES}
        ${CMAKE_CUDA11_COMPILE_FEATURES}
        ${CMAKE_CUDA14_COMPILE_FEATURES}
        ${CMAKE_CUDA17_COMPILE_FEATURES}
        ${CMAKE_CUDA20_COMPILE_FEATURES}
        ${CMAKE_CUDA23_COMPILE_FEATURES}
        ${CMAKE_CUDA26_COMPILE_FEATURES}
      )
    endif()

    set(CMAKE_CUDA_COMPILE_FEATURES ${CMAKE_CUDA_COMPILE_FEATURES} PARENT_SCOPE)
    set(CMAKE_CUDA03_COMPILE_FEATURES ${CMAKE_CUDA03_COMPILE_FEATURES} PARENT_SCOPE)
    set(CMAKE_CUDA11_COMPILE_FEATURES ${CMAKE_CUDA11_COMPILE_FEATURES} PARENT_SCOPE)
    set(CMAKE_CUDA14_COMPILE_FEATURES ${CMAKE_CUDA14_COMPILE_FEATURES} PARENT_SCOPE)
    set(CMAKE_CUDA17_COMPILE_FEATURES ${CMAKE_CUDA17_COMPILE_FEATURES} PARENT_SCOPE)
    set(CMAKE_CUDA20_COMPILE_FEATURES ${CMAKE_CUDA20_COMPILE_FEATURES} PARENT_SCOPE)
    set(CMAKE_CUDA23_COMPILE_FEATURES ${CMAKE_CUDA23_COMPILE_FEATURES} PARENT_SCOPE)
    set(CMAKE_CUDA26_COMPILE_FEATURES ${CMAKE_CUDA26_COMPILE_FEATURES} PARENT_SCOPE)

    message(CHECK_PASS "done")

  elseif(lang STREQUAL HIP AND COMMAND cmake_record_hip_compile_features)
    message(CHECK_START "Detecting ${lang} compile features")

    set(CMAKE_HIP98_COMPILE_FEATURES)
    set(CMAKE_HIP11_COMPILE_FEATURES)
    set(CMAKE_HIP14_COMPILE_FEATURES)
    set(CMAKE_HIP17_COMPILE_FEATURES)
    set(CMAKE_HIP20_COMPILE_FEATURES)
    set(CMAKE_HIP23_COMPILE_FEATURES)
    set(CMAKE_HIP26_COMPILE_FEATURES)


    include("${CMAKE_ROOT}/Modules/Internal/FeatureTesting.cmake")

    cmake_record_hip_compile_features()

    if(NOT _result EQUAL 0)
      message(CHECK_FAIL "failed")
      return()
    endif()

    if (CMAKE_HIP23_COMPILE_FEATURES AND CMAKE_HIP26_COMPILE_FEATURES)
      list(REMOVE_ITEM CMAKE_HIP26_COMPILE_FEATURES ${CMAKE_HIP23_COMPILE_FEATURES})
    endif()
    if (CMAKE_HIP20_COMPILE_FEATURES AND CMAKE_HIP23_COMPILE_FEATURES)
      list(REMOVE_ITEM CMAKE_HIP23_COMPILE_FEATURES ${CMAKE_HIP20_COMPILE_FEATURES})
    endif()
    if (CMAKE_HIP17_COMPILE_FEATURES AND CMAKE_HIP20_COMPILE_FEATURES)
      list(REMOVE_ITEM CMAKE_HIP20_COMPILE_FEATURES ${CMAKE_HIP17_COMPILE_FEATURES})
    endif()
    if (CMAKE_HIP14_COMPILE_FEATURES AND CMAKE_HIP17_COMPILE_FEATURES)
      list(REMOVE_ITEM CMAKE_HIP17_COMPILE_FEATURES ${CMAKE_HIP14_COMPILE_FEATURES})
    endif()
    if (CMAKE_HIP11_COMPILE_FEATURES AND CMAKE_HIP14_COMPILE_FEATURES)
      list(REMOVE_ITEM CMAKE_HIP14_COMPILE_FEATURES ${CMAKE_HIP11_COMPILE_FEATURES})
    endif()
    if (CMAKE_HIP98_COMPILE_FEATURES AND CMAKE_HIP11_COMPILE_FEATURES)
      list(REMOVE_ITEM CMAKE_HIP11_COMPILE_FEATURES ${CMAKE_HIP98_COMPILE_FEATURES})
    endif()

    if(NOT CMAKE_HIP_COMPILE_FEATURES)
      set(CMAKE_HIP_COMPILE_FEATURES
        ${CMAKE_HIP98_COMPILE_FEATURES}
        ${CMAKE_HIP11_COMPILE_FEATURES}
        ${CMAKE_HIP14_COMPILE_FEATURES}
        ${CMAKE_HIP17_COMPILE_FEATURES}
        ${CMAKE_HIP20_COMPILE_FEATURES}
        ${CMAKE_HIP23_COMPILE_FEATURES}
        ${CMAKE_HIP26_COMPILE_FEATURES}
      )
    endif()

    set(CMAKE_HIP_COMPILE_FEATURES ${CMAKE_HIP_COMPILE_FEATURES} PARENT_SCOPE)
    set(CMAKE_HIP98_COMPILE_FEATURES ${CMAKE_HIP98_COMPILE_FEATURES} PARENT_SCOPE)
    set(CMAKE_HIP11_COMPILE_FEATURES ${CMAKE_HIP11_COMPILE_FEATURES} PARENT_SCOPE)
    set(CMAKE_HIP14_COMPILE_FEATURES ${CMAKE_HIP14_COMPILE_FEATURES} PARENT_SCOPE)
    set(CMAKE_HIP17_COMPILE_FEATURES ${CMAKE_HIP17_COMPILE_FEATURES} PARENT_SCOPE)
    set(CMAKE_HIP20_COMPILE_FEATURES ${CMAKE_HIP20_COMPILE_FEATURES} PARENT_SCOPE)
    set(CMAKE_HIP23_COMPILE_FEATURES ${CMAKE_HIP23_COMPILE_FEATURES} PARENT_SCOPE)
    set(CMAKE_HIP26_COMPILE_FEATURES ${CMAKE_HIP26_COMPILE_FEATURES} PARENT_SCOPE)

    message(CHECK_PASS "done")

  endif()

endfunction()