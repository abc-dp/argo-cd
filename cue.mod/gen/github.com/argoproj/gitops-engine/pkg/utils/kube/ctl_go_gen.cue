// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/argoproj/gitops-engine/pkg/utils/kube

package kube

import (
	"github.com/go-logr/logr"
	"github.com/argoproj/gitops-engine/pkg/utils/tracing"
	"k8s.io/apimachinery/pkg/runtime/schema"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
)

#Kubectl: _

#KubectlCmd: {
	Log:    logr.#Logger
	Tracer: tracing.#Tracer
}

#APIResourceInfo: {
	GroupKind:            schema.#GroupKind
	Meta:                 metav1.#APIResource
	GroupVersionResource: schema.#GroupVersionResource
}
