// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go k8s.io/api/certificates/v1

package v1

import (
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
	"k8s.io/api/core/v1"
)

// CertificateSigningRequest objects provide a mechanism to obtain x509 certificates
// by submitting a certificate signing request, and having it asynchronously approved and issued.
//
// Kubelets use this API to obtain:
//  1. client certificates to authenticate to kube-apiserver (with the "kubernetes.io/kube-apiserver-client-kubelet" signerName).
//  2. serving certificates for TLS endpoints kube-apiserver can connect to securely (with the "kubernetes.io/kubelet-serving" signerName).
//
// This API can be used to request client certificates to authenticate to kube-apiserver
// (with the "kubernetes.io/kube-apiserver-client" signerName),
// or to obtain certificates from custom non-Kubernetes signers.
#CertificateSigningRequest: {
	metav1.#TypeMeta

	// +optional
	metadata?: metav1.#ObjectMeta @go(ObjectMeta) @protobuf(1,bytes,opt)

	// spec contains the certificate request, and is immutable after creation.
	// Only the request, signerName, expirationSeconds, and usages fields can be set on creation.
	// Other fields are derived by Kubernetes and cannot be modified by users.
	spec: #CertificateSigningRequestSpec @go(Spec) @protobuf(2,bytes,opt)

	// status contains information about whether the request is approved or denied,
	// and the certificate issued by the signer, or the failure condition indicating signer failure.
	// +optional
	status?: #CertificateSigningRequestStatus @go(Status) @protobuf(3,bytes,opt)
}

// CertificateSigningRequestSpec contains the certificate request.
#CertificateSigningRequestSpec: {
	// request contains an x509 certificate signing request encoded in a "CERTIFICATE REQUEST" PEM block.
	// When serialized as JSON or YAML, the data is additionally base64-encoded.
	// +listType=atomic
	request: bytes @go(Request,[]byte) @protobuf(1,bytes,opt)

	// signerName indicates the requested signer, and is a qualified name.
	//
	// List/watch requests for CertificateSigningRequests can filter on this field using a "spec.signerName=NAME" fieldSelector.
	//
	// Well-known Kubernetes signers are:
	//  1. "kubernetes.io/kube-apiserver-client": issues client certificates that can be used to authenticate to kube-apiserver.
	//   Requests for this signer are never auto-approved by kube-controller-manager, can be issued by the "csrsigning" controller in kube-controller-manager.
	//  2. "kubernetes.io/kube-apiserver-client-kubelet": issues client certificates that kubelets use to authenticate to kube-apiserver.
	//   Requests for this signer can be auto-approved by the "csrapproving" controller in kube-controller-manager, and can be issued by the "csrsigning" controller in kube-controller-manager.
	//  3. "kubernetes.io/kubelet-serving" issues serving certificates that kubelets use to serve TLS endpoints, which kube-apiserver can connect to securely.
	//   Requests for this signer are never auto-approved by kube-controller-manager, and can be issued by the "csrsigning" controller in kube-controller-manager.
	//
	// More details are available at https://k8s.io/docs/reference/access-authn-authz/certificate-signing-requests/#kubernetes-signers
	//
	// Custom signerNames can also be specified. The signer defines:
	//  1. Trust distribution: how trust (CA bundles) are distributed.
	//  2. Permitted subjects: and behavior when a disallowed subject is requested.
	//  3. Required, permitted, or forbidden x509 extensions in the request (including whether subjectAltNames are allowed, which types, restrictions on allowed values) and behavior when a disallowed extension is requested.
	//  4. Required, permitted, or forbidden key usages / extended key usages.
	//  5. Expiration/certificate lifetime: whether it is fixed by the signer, configurable by the admin.
	//  6. Whether or not requests for CA certificates are allowed.
	signerName: string @go(SignerName) @protobuf(7,bytes,opt)

	// expirationSeconds is the requested duration of validity of the issued
	// certificate. The certificate signer may issue a certificate with a different
	// validity duration so a client must check the delta between the notBefore and
	// and notAfter fields in the issued certificate to determine the actual duration.
	//
	// The v1.22+ in-tree implementations of the well-known Kubernetes signers will
	// honor this field as long as the requested duration is not greater than the
	// maximum duration they will honor per the --cluster-signing-duration CLI
	// flag to the Kubernetes controller manager.
	//
	// Certificate signers may not honor this field for various reasons:
	//
	//   1. Old signer that is unaware of the field (such as the in-tree
	//      implementations prior to v1.22)
	//   2. Signer whose configured maximum is shorter than the requested duration
	//   3. Signer whose configured minimum is longer than the requested duration
	//
	// The minimum valid value for expirationSeconds is 600, i.e. 10 minutes.
	//
	// +optional
	expirationSeconds?: null | int32 @go(ExpirationSeconds,*int32) @protobuf(8,varint,opt)

	// usages specifies a set of key usages requested in the issued certificate.
	//
	// Requests for TLS client certificates typically request: "digital signature", "key encipherment", "client auth".
	//
	// Requests for TLS serving certificates typically request: "key encipherment", "digital signature", "server auth".
	//
	// Valid values are:
	//  "signing", "digital signature", "content commitment",
	//  "key encipherment", "key agreement", "data encipherment",
	//  "cert sign", "crl sign", "encipher only", "decipher only", "any",
	//  "server auth", "client auth",
	//  "code signing", "email protection", "s/mime",
	//  "ipsec end system", "ipsec tunnel", "ipsec user",
	//  "timestamping", "ocsp signing", "microsoft sgc", "netscape sgc"
	// +listType=atomic
	usages?: [...#KeyUsage] @go(Usages,[]KeyUsage) @protobuf(5,bytes,opt)

	// username contains the name of the user that created the CertificateSigningRequest.
	// Populated by the API server on creation and immutable.
	// +optional
	username?: string @go(Username) @protobuf(2,bytes,opt)

	// uid contains the uid of the user that created the CertificateSigningRequest.
	// Populated by the API server on creation and immutable.
	// +optional
	uid?: string @go(UID) @protobuf(3,bytes,opt)

	// groups contains group membership of the user that created the CertificateSigningRequest.
	// Populated by the API server on creation and immutable.
	// +listType=atomic
	// +optional
	groups?: [...string] @go(Groups,[]string) @protobuf(4,bytes,rep)

	// extra contains extra attributes of the user that created the CertificateSigningRequest.
	// Populated by the API server on creation and immutable.
	// +optional
	extra?: {[string]: #ExtraValue} @go(Extra,map[string]ExtraValue) @protobuf(6,bytes,rep)
}

// "kubernetes.io/kube-apiserver-client" signer issues client certificates that can be used to authenticate to kube-apiserver.
// Never auto-approved by kube-controller-manager.
// Can be issued by the "csrsigning" controller in kube-controller-manager.
#KubeAPIServerClientSignerName: "kubernetes.io/kube-apiserver-client"

// "kubernetes.io/kube-apiserver-client-kubelet" issues client certificates that kubelets use to authenticate to kube-apiserver.
// Can be auto-approved by the "csrapproving" controller in kube-controller-manager.
// Can be issued by the "csrsigning" controller in kube-controller-manager.
#KubeAPIServerClientKubeletSignerName: "kubernetes.io/kube-apiserver-client-kubelet"

// "kubernetes.io/kubelet-serving" issues serving certificates that kubelets use to serve TLS endpoints,
// which kube-apiserver can connect to securely.
// Never auto-approved by kube-controller-manager.
// Can be issued by the "csrsigning" controller in kube-controller-manager.
#KubeletServingSignerName: "kubernetes.io/kubelet-serving"

// ExtraValue masks the value so protobuf can generate
// +protobuf.nullable=true
// +protobuf.options.(gogoproto.goproto_stringer)=false
#ExtraValue: [...string]

// CertificateSigningRequestStatus contains conditions used to indicate
// approved/denied/failed status of the request, and the issued certificate.
#CertificateSigningRequestStatus: {
	// conditions applied to the request. Known conditions are "Approved", "Denied", and "Failed".
	// +listType=map
	// +listMapKey=type
	// +optional
	conditions?: [...#CertificateSigningRequestCondition] @go(Conditions,[]CertificateSigningRequestCondition) @protobuf(1,bytes,rep)

	// certificate is populated with an issued certificate by the signer after an Approved condition is present.
	// This field is set via the /status subresource. Once populated, this field is immutable.
	//
	// If the certificate signing request is denied, a condition of type "Denied" is added and this field remains empty.
	// If the signer cannot issue the certificate, a condition of type "Failed" is added and this field remains empty.
	//
	// Validation requirements:
	//  1. certificate must contain one or more PEM blocks.
	//  2. All PEM blocks must have the "CERTIFICATE" label, contain no headers, and the encoded data
	//   must be a BER-encoded ASN.1 Certificate structure as described in section 4 of RFC5280.
	//  3. Non-PEM content may appear before or after the "CERTIFICATE" PEM blocks and is unvalidated,
	//   to allow for explanatory text as described in section 5.2 of RFC7468.
	//
	// If more than one PEM block is present, and the definition of the requested spec.signerName
	// does not indicate otherwise, the first block is the issued certificate,
	// and subsequent blocks should be treated as intermediate certificates and presented in TLS handshakes.
	//
	// The certificate is encoded in PEM format.
	//
	// When serialized as JSON or YAML, the data is additionally base64-encoded, so it consists of:
	//
	//     base64(
	//     -----BEGIN CERTIFICATE-----
	//     ...
	//     -----END CERTIFICATE-----
	//     )
	//
	// +listType=atomic
	// +optional
	certificate?: bytes @go(Certificate,[]byte) @protobuf(2,bytes,opt)
}

// RequestConditionType is the type of a CertificateSigningRequestCondition
#RequestConditionType: string // #enumRequestConditionType

#enumRequestConditionType:
	#CertificateApproved |
	#CertificateDenied |
	#CertificateFailed

// Approved indicates the request was approved and should be issued by the signer.
#CertificateApproved: #RequestConditionType & "Approved"

// Denied indicates the request was denied and should not be issued by the signer.
#CertificateDenied: #RequestConditionType & "Denied"

// Failed indicates the signer failed to issue the certificate.
#CertificateFailed: #RequestConditionType & "Failed"

// CertificateSigningRequestCondition describes a condition of a CertificateSigningRequest object
#CertificateSigningRequestCondition: {
	// type of the condition. Known conditions are "Approved", "Denied", and "Failed".
	//
	// An "Approved" condition is added via the /approval subresource,
	// indicating the request was approved and should be issued by the signer.
	//
	// A "Denied" condition is added via the /approval subresource,
	// indicating the request was denied and should not be issued by the signer.
	//
	// A "Failed" condition is added via the /status subresource,
	// indicating the signer failed to issue the certificate.
	//
	// Approved and Denied conditions are mutually exclusive.
	// Approved, Denied, and Failed conditions cannot be removed once added.
	//
	// Only one condition of a given type is allowed.
	type: #RequestConditionType @go(Type) @protobuf(1,bytes,opt,casttype=RequestConditionType)

	// status of the condition, one of True, False, Unknown.
	// Approved, Denied, and Failed conditions may not be "False" or "Unknown".
	status: v1.#ConditionStatus @go(Status) @protobuf(6,bytes,opt,casttype=k8s.io/api/core/v1.ConditionStatus)

	// reason indicates a brief reason for the request state
	// +optional
	reason?: string @go(Reason) @protobuf(2,bytes,opt)

	// message contains a human readable message with details about the request state
	// +optional
	message?: string @go(Message) @protobuf(3,bytes,opt)

	// lastUpdateTime is the time of the last update to this condition
	// +optional
	lastUpdateTime?: metav1.#Time @go(LastUpdateTime) @protobuf(4,bytes,opt)

	// lastTransitionTime is the time the condition last transitioned from one status to another.
	// If unset, when a new condition type is added or an existing condition's status is changed,
	// the server defaults this to the current time.
	// +optional
	lastTransitionTime?: metav1.#Time @go(LastTransitionTime) @protobuf(5,bytes,opt)
}

// CertificateSigningRequestList is a collection of CertificateSigningRequest objects
#CertificateSigningRequestList: {
	metav1.#TypeMeta

	// +optional
	metadata?: metav1.#ListMeta @go(ListMeta) @protobuf(1,bytes,opt)

	// items is a collection of CertificateSigningRequest objects
	items: [...#CertificateSigningRequest] @go(Items,[]CertificateSigningRequest) @protobuf(2,bytes,rep)
}

// KeyUsage specifies valid usage contexts for keys.
// See:
//
//	https://tools.ietf.org/html/rfc5280#section-4.2.1.3
//	https://tools.ietf.org/html/rfc5280#section-4.2.1.12
//
// +enum
#KeyUsage: string // #enumKeyUsage

#enumKeyUsage:
	#UsageSigning |
	#UsageDigitalSignature |
	#UsageContentCommitment |
	#UsageKeyEncipherment |
	#UsageKeyAgreement |
	#UsageDataEncipherment |
	#UsageCertSign |
	#UsageCRLSign |
	#UsageEncipherOnly |
	#UsageDecipherOnly |
	#UsageAny |
	#UsageServerAuth |
	#UsageClientAuth |
	#UsageCodeSigning |
	#UsageEmailProtection |
	#UsageSMIME |
	#UsageIPsecEndSystem |
	#UsageIPsecTunnel |
	#UsageIPsecUser |
	#UsageTimestamping |
	#UsageOCSPSigning |
	#UsageMicrosoftSGC |
	#UsageNetscapeSGC

#UsageSigning:           #KeyUsage & "signing"
#UsageDigitalSignature:  #KeyUsage & "digital signature"
#UsageContentCommitment: #KeyUsage & "content commitment"
#UsageKeyEncipherment:   #KeyUsage & "key encipherment"
#UsageKeyAgreement:      #KeyUsage & "key agreement"
#UsageDataEncipherment:  #KeyUsage & "data encipherment"
#UsageCertSign:          #KeyUsage & "cert sign"
#UsageCRLSign:           #KeyUsage & "crl sign"
#UsageEncipherOnly:      #KeyUsage & "encipher only"
#UsageDecipherOnly:      #KeyUsage & "decipher only"
#UsageAny:               #KeyUsage & "any"
#UsageServerAuth:        #KeyUsage & "server auth"
#UsageClientAuth:        #KeyUsage & "client auth"
#UsageCodeSigning:       #KeyUsage & "code signing"
#UsageEmailProtection:   #KeyUsage & "email protection"
#UsageSMIME:             #KeyUsage & "s/mime"
#UsageIPsecEndSystem:    #KeyUsage & "ipsec end system"
#UsageIPsecTunnel:       #KeyUsage & "ipsec tunnel"
#UsageIPsecUser:         #KeyUsage & "ipsec user"
#UsageTimestamping:      #KeyUsage & "timestamping"
#UsageOCSPSigning:       #KeyUsage & "ocsp signing"
#UsageMicrosoftSGC:      #KeyUsage & "microsoft sgc"
#UsageNetscapeSGC:       #KeyUsage & "netscape sgc"
