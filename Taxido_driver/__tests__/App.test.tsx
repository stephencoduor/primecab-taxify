/**
 * @format
 */

import 'react-native'
import React from 'react'
import App from '../App'
import ReactTestRenderer from 'react-test-renderer'
import { test } from '@jest/globals'
import renderer from 'react-test-renderer'

test('renders correctly', async () => {
  await ReactTestRenderer.act(() => {
    ReactTestRenderer.create(<App />)
  })
})
