#!/usr/bin/php
<?php

abstract class GFTornPager {

  public static function run( $directory ) {
    $returns = '';
    $files = scandir( $directory );
    $files2 = [];
    
    while( ($fileName = array_pop( $files ) ) ) {
      if( preg_match( '/(.*)\.xcf$/', $fileName, $matches ) === 1 ) {
        $files2 []= [
          $directory. $matches[ 1 ]. '.xcf',
          $directory. $matches[ 1 ]. '.png',
        ];
      }
    }
    
    $returns .= 'gimp -i \\'. PHP_EOL;
    foreach( $files2 as $fileName )
      $returns .=
        '-b \'(gf-batch-torn-paper'.
        ' "'. $fileName[ 0 ]. '" '. '"'. $fileName[ 1 ]. '")\' \\'. PHP_EOL;
    $returns .= '-b \'(gimp-quit 0)\'';
    
    return $returns;
  }
  
}



$command = GFTornPager::run( $argv[ 1 ] );
echo $command. PHP_EOL;
passthru( $command );
