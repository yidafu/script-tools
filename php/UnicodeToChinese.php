#!/usr/bin/env php
<?php
/**
 * @TODO  使用dir 函数,使用立即执行函数重构
 */

/**
 * 文件名转义,解决文件名里面的 空格 ( ) $ & 等特殊字符
 * @param  [string] $orgin_str
 * @return [string]            转义后的字符串
 */
function file_escaped( $orgin_str ) {
    return str_replace("&","\&",
                str_replace("$", "\$",
                    str_replace( " ", "\ ",
                        str_replace( "(", "\(",
                            str_replace( ")", "\)",
                                $orgin_str
                            )
                        )
                    )
                )
         );
}

/**
 * 将当前目录下的文件转为正常汉字
 * @param  array $dir_arr 构成当前目录路径的数组,由于不需要对 $dir_arr 数组进行 pop 操
 * 作,不传引用
 * @return void
 */
function convert_filename_in_current_dir( array $dir_arr ) {

    $path = file_escaped( implode("", $dir_arr ) );

    $current_dir_files = [];
    exec( "ls " . $path, $current_dir_files );

    foreach( $current_dir_files as $file_item ) {
        // 忽略目录
        if( is_array( $file_item ) && preg_match( "/*.*/", $file_item ) ) {
            echo "\n".$file_item."ignored \n";
            continue;
        }
        // 转义原文件名
        $escaped_filename = file_escaped( $file_item );

        // 根据需求替换字符串
        $replacement = '';
        $replacement =str_replace( "#U", "\\u" ,$file_item ) ;
        /*
        @NOTE json_decode() 对于 '["\u4e2d\u6587"]' 一个元素的数组的中文转换有问题
         */
        $replacement = file_escaped( json_decode( '[ "' . $replacement . '","msg" ]' )[0] );

        // 文件同名就跳过
        if( $replacement == $escaped_filename ) continue;

        echo $cmd = "mv " . $path . $escaped_filename ." ". $path . $replacement;

        exec( $cmd, $msg );
        print_r( $msg );
    }

}

/**
 * 这是个递归函数.当当前目录下有子目录是调用该函数本身,该函数还将当前下的不正常文件名通过.
 * convert_filename_in_current_dir 函数转换为中文.
 * @param  array   $$dir_arr 构成当前目录路径的数组的引用,如果不使用引用,当从递归回来以后,
 * $dir_arr 的 pop 操作对当前的数组无影响.
 * @return void
 */
function convert_this_subdir( array &$dir_arr ) {
    /****************************************************/
    /*  留作纪念 */
    /*
    @NOTE 这里的 `&&` 连接两个命令和 `&` 连接两个命令不一样
     */
    // exec("cd " . $dir_name . " && pwd", $res);
    /*****************************************************/
    $current_path = file_escaped( implode( "", $dir_arr ) );
    echo "> I am here: " . $current_path . "\n";
    $dirs = [];
    // 得到当前目录的子目录
    exec( "ls -F " . $current_path . "| grep /$", $dirs);
    // 先将当前的子目录转换
    foreach ( $dirs as $dir ) {
        echo "--> Go to" . $dir . "\n";
        $dir_arr[] =  $dir ;
        // 递归
        convert_this_subdir( $dir_arr );
    }
    // 转换当前目录名称.
    convert_filename_in_current_dir( $dir_arr );
    // 从 $dir_arr 中 pop 当前的目录
    array_pop( $dir_arr );
}

/**
 * 存放目录路径 如:["/home/username/Ebook/", "computer/"],只要调用 implode 函数即可得
 * 到当前路径 /home/username/Ebook/computer/.
 * @var array
 */
$dir_arr = [];

$dir_arr[] =  file_escaped( __DIR__ ."/" );

// 调用函数
convert_this_subdir( $dir_arr );
