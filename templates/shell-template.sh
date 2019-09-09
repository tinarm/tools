set -o errexit  # Abort script if any command exits with non-zero code.
set -o errtrace # Propagate the above to functions and subshells.

# If this script fails, print the failing line.
trap 'echo "script aborted at ${LINENO}"; exit 1' ERR

