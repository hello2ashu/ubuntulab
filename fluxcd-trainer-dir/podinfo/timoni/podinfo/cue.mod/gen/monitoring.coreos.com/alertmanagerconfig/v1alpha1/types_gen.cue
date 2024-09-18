// Code generated by timoni. DO NOT EDIT.

//timoni:generate timoni import crd -f https://github.com/prometheus-operator/prometheus-operator/releases/download/v0.68.0/stripped-down-crds.yaml

package v1alpha1

import "strings"

#AlertmanagerConfig: {
	apiVersion: "monitoring.coreos.com/v1alpha1"
	kind:       "AlertmanagerConfig"
	metadata!: {
		name!: strings.MaxRunes(253) & strings.MinRunes(1) & {
			string
		}
		namespace!: strings.MaxRunes(63) & strings.MinRunes(1) & {
			string
		}
		labels?: {
			[string]: string
		}
		annotations?: {
			[string]: string
		}
	}
	spec!: #AlertmanagerConfigSpec
}
#AlertmanagerConfigSpec: {
	inhibitRules?: [...{
		equal?: [...string]
		sourceMatch?: [...{
			matchType?: "!=" | "=" | "=~" | "!~"
			name:       strings.MinRunes(1)
			regex?:     bool
			value?:     string
		}]
		targetMatch?: [...{
			matchType?: "!=" | "=" | "=~" | "!~"
			name:       strings.MinRunes(1)
			regex?:     bool
			value?:     string
		}]
	}]
	muteTimeIntervals?: [...{
		name?: string
		timeIntervals?: [...{
			daysOfMonth?: [...{
				end?:   int & >=-31 & <=31
				start?: int & >=-31 & <=31
			}]
			months?: [...=~"^((?i)january|february|march|april|may|june|july|august|september|october|november|december|[1-12])(?:((:((?i)january|february|march|april|may|june|july|august|september|october|november|december|[1-12]))$)|$)"]
			times?: [...{
				endTime?:   =~"^((([01][0-9])|(2[0-3])):[0-5][0-9])$|(^24:00$)"
				startTime?: =~"^((([01][0-9])|(2[0-3])):[0-5][0-9])$|(^24:00$)"
			}]
			weekdays?: [...=~"^((?i)sun|mon|tues|wednes|thurs|fri|satur)day(?:((:(sun|mon|tues|wednes|thurs|fri|satur)day)$)|$)"]
			years?: [...=~"^2\\d{3}(?::2\\d{3}|$)"]
		}]
	}]
	receivers?: [...{
		discordConfigs?: [...{
			apiURL: {
				key:       string
				name?:     string
				optional?: bool
			}
			httpConfig?: {
				authorization?: {
					credentials?: {
						key:       string
						name?:     string
						optional?: bool
					}
					type?: string
				}
				basicAuth?: {
					password?: {
						key:       string
						name?:     string
						optional?: bool
					}
					username?: {
						key:       string
						name?:     string
						optional?: bool
					}
				}
				bearerTokenSecret?: {
					key:       string
					name?:     string
					optional?: bool
				}
				followRedirects?: bool
				oauth2?: {
					clientId: {
						configMap?: {
							key:       string
							name?:     string
							optional?: bool
						}
						secret?: {
							key:       string
							name?:     string
							optional?: bool
						}
					}
					clientSecret: {
						key:       string
						name?:     string
						optional?: bool
					}
					endpointParams?: {
						[string]: string
					}
					scopes?: [...string]
					tokenUrl: strings.MinRunes(1)
				}
				proxyURL?: string
				tlsConfig?: {
					ca?: {
						configMap?: {
							key:       string
							name?:     string
							optional?: bool
						}
						secret?: {
							key:       string
							name?:     string
							optional?: bool
						}
					}
					cert?: {
						configMap?: {
							key:       string
							name?:     string
							optional?: bool
						}
						secret?: {
							key:       string
							name?:     string
							optional?: bool
						}
					}
					insecureSkipVerify?: bool
					keySecret?: {
						key:       string
						name?:     string
						optional?: bool
					}
					serverName?: string
				}
			}
			message?:      string
			sendResolved?: bool
			title?:        string
		}]
		emailConfigs?: [...{
			authIdentity?: string
			authPassword?: {
				key:       string
				name?:     string
				optional?: bool
			}
			authSecret?: {
				key:       string
				name?:     string
				optional?: bool
			}
			authUsername?: string
			from?:         string
			headers?: [...{
				key:   strings.MinRunes(1)
				value: string
			}]
			hello?:        string
			html?:         string
			requireTLS?:   bool
			sendResolved?: bool
			smarthost?:    string
			text?:         string
			tlsConfig?: {
				ca?: {
					configMap?: {
						key:       string
						name?:     string
						optional?: bool
					}
					secret?: {
						key:       string
						name?:     string
						optional?: bool
					}
				}
				cert?: {
					configMap?: {
						key:       string
						name?:     string
						optional?: bool
					}
					secret?: {
						key:       string
						name?:     string
						optional?: bool
					}
				}
				insecureSkipVerify?: bool
				keySecret?: {
					key:       string
					name?:     string
					optional?: bool
				}
				serverName?: string
			}
			to?: string
		}]
		name: strings.MinRunes(1)
		opsgenieConfigs?: [...{
			actions?: string
			apiKey?: {
				key:       string
				name?:     string
				optional?: bool
			}
			apiURL?: string
			details?: [...{
				key:   strings.MinRunes(1)
				value: string
			}]
			entity?: string
			httpConfig?: {
				authorization?: {
					credentials?: {
						key:       string
						name?:     string
						optional?: bool
					}
					type?: string
				}
				basicAuth?: {
					password?: {
						key:       string
						name?:     string
						optional?: bool
					}
					username?: {
						key:       string
						name?:     string
						optional?: bool
					}
				}
				bearerTokenSecret?: {
					key:       string
					name?:     string
					optional?: bool
				}
				followRedirects?: bool
				oauth2?: {
					clientId: {
						configMap?: {
							key:       string
							name?:     string
							optional?: bool
						}
						secret?: {
							key:       string
							name?:     string
							optional?: bool
						}
					}
					clientSecret: {
						key:       string
						name?:     string
						optional?: bool
					}
					endpointParams?: {
						[string]: string
					}
					scopes?: [...string]
					tokenUrl: strings.MinRunes(1)
				}
				proxyURL?: string
				tlsConfig?: {
					ca?: {
						configMap?: {
							key:       string
							name?:     string
							optional?: bool
						}
						secret?: {
							key:       string
							name?:     string
							optional?: bool
						}
					}
					cert?: {
						configMap?: {
							key:       string
							name?:     string
							optional?: bool
						}
						secret?: {
							key:       string
							name?:     string
							optional?: bool
						}
					}
					insecureSkipVerify?: bool
					keySecret?: {
						key:       string
						name?:     string
						optional?: bool
					}
					serverName?: string
				}
			}
			message?:  string
			note?:     string
			priority?: string
			responders?: [...{
				id?:       string
				name?:     string
				type:      ("team" | "teams" | "user" | "escalation" | "schedule") & strings.MinRunes(1)
				username?: string
			}]
			sendResolved?: bool
			source?:       string
			tags?:         string
			updateAlerts?: bool
		}]
		pagerdutyConfigs?: [...{
			class?:     string
			client?:    string
			clientURL?: string
			component?: string
			details?: [...{
				key:   strings.MinRunes(1)
				value: string
			}]
			group?: string
			httpConfig?: {
				authorization?: {
					credentials?: {
						key:       string
						name?:     string
						optional?: bool
					}
					type?: string
				}
				basicAuth?: {
					password?: {
						key:       string
						name?:     string
						optional?: bool
					}
					username?: {
						key:       string
						name?:     string
						optional?: bool
					}
				}
				bearerTokenSecret?: {
					key:       string
					name?:     string
					optional?: bool
				}
				followRedirects?: bool
				oauth2?: {
					clientId: {
						configMap?: {
							key:       string
							name?:     string
							optional?: bool
						}
						secret?: {
							key:       string
							name?:     string
							optional?: bool
						}
					}
					clientSecret: {
						key:       string
						name?:     string
						optional?: bool
					}
					endpointParams?: {
						[string]: string
					}
					scopes?: [...string]
					tokenUrl: strings.MinRunes(1)
				}
				proxyURL?: string
				tlsConfig?: {
					ca?: {
						configMap?: {
							key:       string
							name?:     string
							optional?: bool
						}
						secret?: {
							key:       string
							name?:     string
							optional?: bool
						}
					}
					cert?: {
						configMap?: {
							key:       string
							name?:     string
							optional?: bool
						}
						secret?: {
							key:       string
							name?:     string
							optional?: bool
						}
					}
					insecureSkipVerify?: bool
					keySecret?: {
						key:       string
						name?:     string
						optional?: bool
					}
					serverName?: string
				}
			}
			pagerDutyImageConfigs?: [...{
				alt?:  string
				href?: string
				src?:  string
			}]
			pagerDutyLinkConfigs?: [...{
				alt?:  string
				href?: string
			}]
			routingKey?: {
				key:       string
				name?:     string
				optional?: bool
			}
			sendResolved?: bool
			serviceKey?: {
				key:       string
				name?:     string
				optional?: bool
			}
			severity?: string
			url?:      string
		}]
		pushoverConfigs?: [...{
			expire?: =~"^(([0-9]+)y)?(([0-9]+)w)?(([0-9]+)d)?(([0-9]+)h)?(([0-9]+)m)?(([0-9]+)s)?(([0-9]+)ms)?$"
			html?:   bool
			httpConfig?: {
				authorization?: {
					credentials?: {
						key:       string
						name?:     string
						optional?: bool
					}
					type?: string
				}
				basicAuth?: {
					password?: {
						key:       string
						name?:     string
						optional?: bool
					}
					username?: {
						key:       string
						name?:     string
						optional?: bool
					}
				}
				bearerTokenSecret?: {
					key:       string
					name?:     string
					optional?: bool
				}
				followRedirects?: bool
				oauth2?: {
					clientId: {
						configMap?: {
							key:       string
							name?:     string
							optional?: bool
						}
						secret?: {
							key:       string
							name?:     string
							optional?: bool
						}
					}
					clientSecret: {
						key:       string
						name?:     string
						optional?: bool
					}
					endpointParams?: {
						[string]: string
					}
					scopes?: [...string]
					tokenUrl: strings.MinRunes(1)
				}
				proxyURL?: string
				tlsConfig?: {
					ca?: {
						configMap?: {
							key:       string
							name?:     string
							optional?: bool
						}
						secret?: {
							key:       string
							name?:     string
							optional?: bool
						}
					}
					cert?: {
						configMap?: {
							key:       string
							name?:     string
							optional?: bool
						}
						secret?: {
							key:       string
							name?:     string
							optional?: bool
						}
					}
					insecureSkipVerify?: bool
					keySecret?: {
						key:       string
						name?:     string
						optional?: bool
					}
					serverName?: string
				}
			}
			message?:      string
			priority?:     string
			retry?:        =~"^(([0-9]+)y)?(([0-9]+)w)?(([0-9]+)d)?(([0-9]+)h)?(([0-9]+)m)?(([0-9]+)s)?(([0-9]+)ms)?$"
			sendResolved?: bool
			sound?:        string
			title?:        string
			token?: {
				key:       string
				name?:     string
				optional?: bool
			}
			url?:      string
			urlTitle?: string
			userKey?: {
				key:       string
				name?:     string
				optional?: bool
			}
		}]
		slackConfigs?: [...{
			actions?: [...{
				confirm?: {
					dismissText?: string
					okText?:      string
					text:         strings.MinRunes(1)
					title?:       string
				}
				name?:  string
				style?: string
				text:   strings.MinRunes(1)
				type:   strings.MinRunes(1)
				url?:   string
				value?: string
			}]
			apiURL?: {
				key:       string
				name?:     string
				optional?: bool
			}
			callbackId?: string
			channel?:    string
			color?:      string
			fallback?:   string
			fields?: [...{
				short?: bool
				title:  strings.MinRunes(1)
				value:  strings.MinRunes(1)
			}]
			footer?: string
			httpConfig?: {
				authorization?: {
					credentials?: {
						key:       string
						name?:     string
						optional?: bool
					}
					type?: string
				}
				basicAuth?: {
					password?: {
						key:       string
						name?:     string
						optional?: bool
					}
					username?: {
						key:       string
						name?:     string
						optional?: bool
					}
				}
				bearerTokenSecret?: {
					key:       string
					name?:     string
					optional?: bool
				}
				followRedirects?: bool
				oauth2?: {
					clientId: {
						configMap?: {
							key:       string
							name?:     string
							optional?: bool
						}
						secret?: {
							key:       string
							name?:     string
							optional?: bool
						}
					}
					clientSecret: {
						key:       string
						name?:     string
						optional?: bool
					}
					endpointParams?: {
						[string]: string
					}
					scopes?: [...string]
					tokenUrl: strings.MinRunes(1)
				}
				proxyURL?: string
				tlsConfig?: {
					ca?: {
						configMap?: {
							key:       string
							name?:     string
							optional?: bool
						}
						secret?: {
							key:       string
							name?:     string
							optional?: bool
						}
					}
					cert?: {
						configMap?: {
							key:       string
							name?:     string
							optional?: bool
						}
						secret?: {
							key:       string
							name?:     string
							optional?: bool
						}
					}
					insecureSkipVerify?: bool
					keySecret?: {
						key:       string
						name?:     string
						optional?: bool
					}
					serverName?: string
				}
			}
			iconEmoji?: string
			iconURL?:   string
			imageURL?:  string
			linkNames?: bool
			mrkdwnIn?: [...string]
			pretext?:      string
			sendResolved?: bool
			shortFields?:  bool
			text?:         string
			thumbURL?:     string
			title?:        string
			titleLink?:    string
			username?:     string
		}]
		snsConfigs?: [...{
			apiURL?: string
			attributes?: {
				[string]: string
			}
			httpConfig?: {
				authorization?: {
					credentials?: {
						key:       string
						name?:     string
						optional?: bool
					}
					type?: string
				}
				basicAuth?: {
					password?: {
						key:       string
						name?:     string
						optional?: bool
					}
					username?: {
						key:       string
						name?:     string
						optional?: bool
					}
				}
				bearerTokenSecret?: {
					key:       string
					name?:     string
					optional?: bool
				}
				followRedirects?: bool
				oauth2?: {
					clientId: {
						configMap?: {
							key:       string
							name?:     string
							optional?: bool
						}
						secret?: {
							key:       string
							name?:     string
							optional?: bool
						}
					}
					clientSecret: {
						key:       string
						name?:     string
						optional?: bool
					}
					endpointParams?: {
						[string]: string
					}
					scopes?: [...string]
					tokenUrl: strings.MinRunes(1)
				}
				proxyURL?: string
				tlsConfig?: {
					ca?: {
						configMap?: {
							key:       string
							name?:     string
							optional?: bool
						}
						secret?: {
							key:       string
							name?:     string
							optional?: bool
						}
					}
					cert?: {
						configMap?: {
							key:       string
							name?:     string
							optional?: bool
						}
						secret?: {
							key:       string
							name?:     string
							optional?: bool
						}
					}
					insecureSkipVerify?: bool
					keySecret?: {
						key:       string
						name?:     string
						optional?: bool
					}
					serverName?: string
				}
			}
			message?:      string
			phoneNumber?:  string
			sendResolved?: bool
			sigv4?: {
				accessKey?: {
					key:       string
					name?:     string
					optional?: bool
				}
				profile?: string
				region?:  string
				roleArn?: string
				secretKey?: {
					key:       string
					name?:     string
					optional?: bool
				}
			}
			subject?:   string
			targetARN?: string
			topicARN?:  string
		}]
		telegramConfigs?: [...{
			apiURL?: string
			botToken?: {
				key:       string
				name?:     string
				optional?: bool
			}
			botTokenFile?:         string
			chatID?:               int
			disableNotifications?: bool
			httpConfig?: {
				authorization?: {
					credentials?: {
						key:       string
						name?:     string
						optional?: bool
					}
					type?: string
				}
				basicAuth?: {
					password?: {
						key:       string
						name?:     string
						optional?: bool
					}
					username?: {
						key:       string
						name?:     string
						optional?: bool
					}
				}
				bearerTokenSecret?: {
					key:       string
					name?:     string
					optional?: bool
				}
				followRedirects?: bool
				oauth2?: {
					clientId: {
						configMap?: {
							key:       string
							name?:     string
							optional?: bool
						}
						secret?: {
							key:       string
							name?:     string
							optional?: bool
						}
					}
					clientSecret: {
						key:       string
						name?:     string
						optional?: bool
					}
					endpointParams?: {
						[string]: string
					}
					scopes?: [...string]
					tokenUrl: strings.MinRunes(1)
				}
				proxyURL?: string
				tlsConfig?: {
					ca?: {
						configMap?: {
							key:       string
							name?:     string
							optional?: bool
						}
						secret?: {
							key:       string
							name?:     string
							optional?: bool
						}
					}
					cert?: {
						configMap?: {
							key:       string
							name?:     string
							optional?: bool
						}
						secret?: {
							key:       string
							name?:     string
							optional?: bool
						}
					}
					insecureSkipVerify?: bool
					keySecret?: {
						key:       string
						name?:     string
						optional?: bool
					}
					serverName?: string
				}
			}
			message?:      string
			parseMode?:    "MarkdownV2" | "Markdown" | "HTML"
			sendResolved?: bool
		}]
		victoropsConfigs?: [...{
			apiKey?: {
				key:       string
				name?:     string
				optional?: bool
			}
			apiUrl?: string
			customFields?: [...{
				key:   strings.MinRunes(1)
				value: string
			}]
			entityDisplayName?: string
			httpConfig?: {
				authorization?: {
					credentials?: {
						key:       string
						name?:     string
						optional?: bool
					}
					type?: string
				}
				basicAuth?: {
					password?: {
						key:       string
						name?:     string
						optional?: bool
					}
					username?: {
						key:       string
						name?:     string
						optional?: bool
					}
				}
				bearerTokenSecret?: {
					key:       string
					name?:     string
					optional?: bool
				}
				followRedirects?: bool
				oauth2?: {
					clientId: {
						configMap?: {
							key:       string
							name?:     string
							optional?: bool
						}
						secret?: {
							key:       string
							name?:     string
							optional?: bool
						}
					}
					clientSecret: {
						key:       string
						name?:     string
						optional?: bool
					}
					endpointParams?: {
						[string]: string
					}
					scopes?: [...string]
					tokenUrl: strings.MinRunes(1)
				}
				proxyURL?: string
				tlsConfig?: {
					ca?: {
						configMap?: {
							key:       string
							name?:     string
							optional?: bool
						}
						secret?: {
							key:       string
							name?:     string
							optional?: bool
						}
					}
					cert?: {
						configMap?: {
							key:       string
							name?:     string
							optional?: bool
						}
						secret?: {
							key:       string
							name?:     string
							optional?: bool
						}
					}
					insecureSkipVerify?: bool
					keySecret?: {
						key:       string
						name?:     string
						optional?: bool
					}
					serverName?: string
				}
			}
			messageType?:    string
			monitoringTool?: string
			routingKey?:     string
			sendResolved?:   bool
			stateMessage?:   string
		}]
		webexConfigs?: [...{
			apiURL?: =~"^https?://.+$"
			httpConfig?: {
				authorization?: {
					credentials?: {
						key:       string
						name?:     string
						optional?: bool
					}
					type?: string
				}
				basicAuth?: {
					password?: {
						key:       string
						name?:     string
						optional?: bool
					}
					username?: {
						key:       string
						name?:     string
						optional?: bool
					}
				}
				bearerTokenSecret?: {
					key:       string
					name?:     string
					optional?: bool
				}
				followRedirects?: bool
				oauth2?: {
					clientId: {
						configMap?: {
							key:       string
							name?:     string
							optional?: bool
						}
						secret?: {
							key:       string
							name?:     string
							optional?: bool
						}
					}
					clientSecret: {
						key:       string
						name?:     string
						optional?: bool
					}
					endpointParams?: {
						[string]: string
					}
					scopes?: [...string]
					tokenUrl: strings.MinRunes(1)
				}
				proxyURL?: string
				tlsConfig?: {
					ca?: {
						configMap?: {
							key:       string
							name?:     string
							optional?: bool
						}
						secret?: {
							key:       string
							name?:     string
							optional?: bool
						}
					}
					cert?: {
						configMap?: {
							key:       string
							name?:     string
							optional?: bool
						}
						secret?: {
							key:       string
							name?:     string
							optional?: bool
						}
					}
					insecureSkipVerify?: bool
					keySecret?: {
						key:       string
						name?:     string
						optional?: bool
					}
					serverName?: string
				}
			}
			message?:      string
			roomID:        strings.MinRunes(1)
			sendResolved?: bool
		}]
		webhookConfigs?: [...{
			httpConfig?: {
				authorization?: {
					credentials?: {
						key:       string
						name?:     string
						optional?: bool
					}
					type?: string
				}
				basicAuth?: {
					password?: {
						key:       string
						name?:     string
						optional?: bool
					}
					username?: {
						key:       string
						name?:     string
						optional?: bool
					}
				}
				bearerTokenSecret?: {
					key:       string
					name?:     string
					optional?: bool
				}
				followRedirects?: bool
				oauth2?: {
					clientId: {
						configMap?: {
							key:       string
							name?:     string
							optional?: bool
						}
						secret?: {
							key:       string
							name?:     string
							optional?: bool
						}
					}
					clientSecret: {
						key:       string
						name?:     string
						optional?: bool
					}
					endpointParams?: {
						[string]: string
					}
					scopes?: [...string]
					tokenUrl: strings.MinRunes(1)
				}
				proxyURL?: string
				tlsConfig?: {
					ca?: {
						configMap?: {
							key:       string
							name?:     string
							optional?: bool
						}
						secret?: {
							key:       string
							name?:     string
							optional?: bool
						}
					}
					cert?: {
						configMap?: {
							key:       string
							name?:     string
							optional?: bool
						}
						secret?: {
							key:       string
							name?:     string
							optional?: bool
						}
					}
					insecureSkipVerify?: bool
					keySecret?: {
						key:       string
						name?:     string
						optional?: bool
					}
					serverName?: string
				}
			}
			maxAlerts?:    >=0 & int
			sendResolved?: bool
			url?:          string
			urlSecret?: {
				key:       string
				name?:     string
				optional?: bool
			}
		}]
		wechatConfigs?: [...{
			agentID?: string
			apiSecret?: {
				key:       string
				name?:     string
				optional?: bool
			}
			apiURL?: string
			corpID?: string
			httpConfig?: {
				authorization?: {
					credentials?: {
						key:       string
						name?:     string
						optional?: bool
					}
					type?: string
				}
				basicAuth?: {
					password?: {
						key:       string
						name?:     string
						optional?: bool
					}
					username?: {
						key:       string
						name?:     string
						optional?: bool
					}
				}
				bearerTokenSecret?: {
					key:       string
					name?:     string
					optional?: bool
				}
				followRedirects?: bool
				oauth2?: {
					clientId: {
						configMap?: {
							key:       string
							name?:     string
							optional?: bool
						}
						secret?: {
							key:       string
							name?:     string
							optional?: bool
						}
					}
					clientSecret: {
						key:       string
						name?:     string
						optional?: bool
					}
					endpointParams?: {
						[string]: string
					}
					scopes?: [...string]
					tokenUrl: strings.MinRunes(1)
				}
				proxyURL?: string
				tlsConfig?: {
					ca?: {
						configMap?: {
							key:       string
							name?:     string
							optional?: bool
						}
						secret?: {
							key:       string
							name?:     string
							optional?: bool
						}
					}
					cert?: {
						configMap?: {
							key:       string
							name?:     string
							optional?: bool
						}
						secret?: {
							key:       string
							name?:     string
							optional?: bool
						}
					}
					insecureSkipVerify?: bool
					keySecret?: {
						key:       string
						name?:     string
						optional?: bool
					}
					serverName?: string
				}
			}
			message?:      string
			messageType?:  string
			sendResolved?: bool
			toParty?:      string
			toTag?:        string
			toUser?:       string
		}]
	}]
	route?: {
		activeTimeIntervals?: [...string]
		continue?: bool
		groupBy?: [...string]
		groupInterval?: string
		groupWait?:     string
		matchers?: [...{
			matchType?: "!=" | "=" | "=~" | "!~"
			name:       strings.MinRunes(1)
			regex?:     bool
			value?:     string
		}]
		muteTimeIntervals?: [...string]
		receiver?:       string
		repeatInterval?: string
		routes?: [...]
	}
}
