#!/usr/bin/env bash

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

docker build --tag $DOCKERFILE_TAG --file ./$DOCKERFILE_DIR/Dockerfile ./$DOCKERFILE_DIR
docker login -u "$DOCKER_USER" -p "$DOCKER_PASSWORD" -e "$DOCKER_EMAIL"
docker push $DOCKERFILE_TAG
