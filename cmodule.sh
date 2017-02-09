#!/usr/bin/env bash

if [ "$#" -ne 1 ]; then
    echo "Wrong number of args. Should be one (1)."
    exit 1
fi

module="$1"
cfile="$module".c
hfile="$module".h

if [ -e "$cfile" ] || [ -e "$hfile" ]; then
    echo "Module already exist"
    exit 1
fi

# Create module source file.
echo '#include <assert.h>' >> "$cfile"
echo '#include <stdlib.h>' >> "$cfile"
echo >> "$cfile"
echo "#include \"${hfile}\"" >> "$cfile"
echo >> "$cfile"
echo "struct $module {" >> "$cfile"
echo >> "$cfile"
echo '};' >> "$cfile"
echo >> "$cfile"
echo "${module}_t * ${module}_new(void)" >> "$cfile"
echo '{' >> "$cfile"
echo "    ${module}_t *self = (${module}_t *) malloc(sizeof(${module}_t));" >> "$cfile"
echo '    assert(self);' >> "$cfile"
echo '    return self;' >> "$cfile"
echo '}' >> "$cfile"
echo >> "$cfile"
echo "void ${module}_destroy(${module}_t **self_p)" >> "$cfile"
echo '{' >> "$cfile"
echo '    assert(self_p);' >> "$cfile"
echo '    if (*self_p) {' >> "$cfile"
echo "        ${module}_t *self = *self_p;" >> "$cfile"
echo >> "$cfile"
echo '        // delete allocated module content' >> "$cfile"
echo >> "$cfile"
echo '        free(self);' >> "$cfile"
echo '        *self_p = NULL;' >> "$cfile"
echo '    }' >> "$cfile"
echo '}' >> "$cfile"
echo >> "$cfile"

# Create module header file.
umodule=$(echo "$module" | awk '{print toupper($0)}')
echo "#ifndef ${umodule}_HEADER_H" >> "$hfile"
echo "#define ${umodule}_HEADER_H" >> "$hfile"
echo >> "$hfile"
echo "typedef struct ${module} ${module}_t;" >> "$hfile"
echo >> "$hfile"
echo "${module}_t * ${module}_new(void);" >> "$hfile"
echo "void ${module}_destroy(${module}_t **self_p);" >> "$hfile"
echo >> "$hfile"
echo '#endif' >> "$hfile"
echo >> "$hfile"
