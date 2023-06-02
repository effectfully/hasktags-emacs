#!/bin/bash

# Copyright 2011 Pavlo Kerestey. All rights reserved.

# Redistribution and use in source and binary forms, with or without modification, are
# permitted provided that the following conditions are met:

#    1. Redistributions of source code must retain the above copyright notice, this list of
#       conditions and the following disclaimer.

#    2. Redistributions in binary form must reproduce the above copyright notice, this list
#       of conditions and the following disclaimer in the documentation and/or other materials
#       provided with the distribution.

# THIS SOFTWARE IS PROVIDED BY Pavlo Kerestey ''AS IS'' AND ANY EXPRESS OR IMPLIED
# WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
# FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL Pavlo Kerestey OR
# CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
# CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
# SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
# ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
# NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
# ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

# The views and conclusions contained in the software and documentation are those of the
# authors and should not be interpreted as representing official policies, either expressed
# or implied, of Pavlo Kerestey.

findProjectRoot() {
  while ( [ "$(find . -maxdepth 1 -name TAGS)" != "./TAGS" ] ) && ( [ "$(pwd)" != "/" ] ); do
    cd ..;
  done
}

exitIfPwdIsRoot() {
  [ "$(pwd)" == "/" ] && ( echo "could not find TAGS file!" ; exit 1 )
}

# TODO maybe it would be better to check for writability of the current working directory instead
generateTags() {
  # hasktags -e .
  fast-tags --qualified -eR .
  # (find . -type f -name \*\.*hs | xargs hasktags -e)
}

findProjectRoot
exitIfPwdIsRoot
generateTags
