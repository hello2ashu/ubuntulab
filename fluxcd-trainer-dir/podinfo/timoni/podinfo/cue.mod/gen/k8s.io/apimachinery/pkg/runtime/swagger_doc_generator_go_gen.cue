// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go k8s.io/apimachinery/pkg/runtime

package runtime

// Pair of strings. We keed the name of fields and the doc
#Pair: {
	Name: string
	Doc:  string
}

// KubeTypes is an array to represent all available types in a parsed file. [0] is for the type itself
#KubeTypes: [...#Pair]
