# au3timer
The power of timer based calls in AutoIt3

Inspired by JS.

You can now request a function to be called once or repeatedly with up to 9 parameters.

## usage

```AutoIt
#include "Timer.au3"

setTimeout('MyExit', 10000)

setTimeout('MsgBox', 5000, 0, "title", "message")

setInterval('WriteTime', 1000)

Func WriteTime()
    ConsoleWrite(StringFormat("%02i:%02i:%02i.%03i\n", @HOUR, @MIN, @SEC, @MSEC))
EndFunc

Func MyExit()
    Exit
EndFunc

While 1
    Sleep(10)
WEnd
```

### setTimeout

call function once after a defined duration

<table>
  <tr>
    <th colspan="3">syntax</th>
  </tr>
  <tr>
    <td colspan="3"><code>setTimeout($function [, $delay = 0 [, $arg1 [, $arg2 [, $arg3 [, $arg4 [, $arg5 [, $arg6 [, $arg7 [, $arg8 [, $arg9]]]]]]]]])</code></td>
  </tr>
  <tr>
    <th colspan="3">arguments</th>
  </tr>
  <tr>
    <th>variable</th>
    <th>type</th>
    <th>description</th>
  </tr>
  <tr>
    <td>$function</td>
    <td>string</td>
    <td>function name</td>
  </tr>
  <tr>
    <td>$delay</td>
    <td>integer</td>
    <td>call delay in milliseconds</td>
  </tr>
  <tr>
    <td>$arg1...$arg9</td>
    <td>mixed</td>
    <td>arguments to be passed to the function call</td>
  </tr>
  <tr>
    <th colspan="3">return</th>
  </tr>
  <tr>
    <th>type</th>
    <th colspan="2">description</th>
  </tr>
  <tr>
    <td>integer</td>
    <td colspan="2">Timer ID</td>
  </tr>
</table>

### setInterval

call function repeatedly after a defined duration

<table>
  <tr>
    <th colspan="3">syntax</th>
  </tr>
  <tr>
    <td colspan="3"><code>setInterval($function [, $delay = 0 [, $arg1 [, $arg2 [, $arg3 [, $arg4 [, $arg5 [, $arg6 [, $arg7 [, $arg8 [, $arg9]]]]]]]]])</code></td>
  </tr>
  <tr>
    <th colspan="3">arguments</th>
  </tr>
  <tr>
    <th>variable</th>
    <th>type</th>
    <th>description</th>
  </tr>
  <tr>
    <td>$function</td>
    <td>string</td>
    <td>function name</td>
  </tr>
  <tr>
    <td>$delay</td>
    <td>integer</td>
    <td>call delay in milliseconds</td>
  </tr>
  <tr>
    <td>$arg1...$arg9</td>
    <td>mixed</td>
    <td>arguments to be passed to the function call</td>
  </tr>
  <tr>
    <th colspan="3">return</th>
  </tr>
  <tr>
    <th>type</th>
    <th colspan="2">description</th>
  </tr>
  <tr>
    <td>integer</td>
    <td colspan="2">Timer ID</td>
  </tr>
</table>
