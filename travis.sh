#!/usr/bin/env bash

# From https://stackoverflow.com/a/8574392/437583.
includes()
{
    local match="$1"
    local element
    shift
    for element; do
        [[ "$element" == "$match" ]] && return 0
    done
    return 1
}


# Logic for checking required variables inspired by
# http://unix.stackexchange.com/a/278974/72230.
required_vars=(
	DOCKER_USER
	DOCKER_PASSWORD
	DOCKERFILE_DIR
	DOCKERFILE_TAG
)
missing_vars=()
# According to "Shell Parameter Expansion", the "!" in ${!...} introduces a
# level of indirection; it basically uses the *value* of the variable to access
# another variable.
for var in "${required_vars[@]}"; do
	if [[ -z "${!var:+x}" ]]; then
		missing_vars+=("$var")
	fi
done

if (( ${#missing_vars[@]} != 0 )); then
	echo "The following variables are not set, or are set to the empty string:" >&2
	printf ' %q\n' "${missing_vars[@]}" >&2
	exit 1
fi

if [[ ! -d $DOCKERFILE_DIR ]]; then
	"directory \`$DOCKERFILE_DIR' does not exist "
	exit 1
fi

to_push=(
    # Only push the Docker image built in the "texlive" subdirectory.
    texlive
)

pushd "${DOCKERFILE_DIR}"
    ./build_container.sh "${DOCKERFILE_TAG}"

    if includes "${DOCKERFILE_DIR}" "${to_push[@]}"; then
        docker login -u "$DOCKER_USER" -p "$DOCKER_PASSWORD"
        docker push "$DOCKERFILE_TAG"
    fi

popd
