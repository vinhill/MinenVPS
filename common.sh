#!/bin/bash

# Resolve repository root (abs path of our folder)
BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Determine JAVA_HOME as ${BASE_DIR}/jdk.*/bin if not set
if [[ -z "${JAVA_HOME:-}" ]]; then
  _detected_jdk="$(ls -d "${BASE_DIR}"/jdk-* 2>/dev/null | head -n 1 || true)"
  if [[ -n "${_detected_jdk}" && -x "${_detected_jdk}/bin/java" ]]; then
    JAVA_HOME="${_detected_jdk}"
  else
    echo "ERROR: No JDK found under ${BASE_DIR}/jdk-* (with bin/java)." >&2
    exit 1
  fi
fi

export JAVA_HOME
export PATH="${JAVA_HOME}/bin:${PATH}"
export MC_VERSION="1.20.1"
export FORGE_VERSION="${MC_VERSION}-47.4.0"
